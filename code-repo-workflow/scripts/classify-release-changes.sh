#!/usr/bin/env bash
# Lives in the CODE repo at .github/workflows/scripts/classify-release-changes.sh.
#
# Deterministic Layer-1 gate for the release-video workflow. Reads the docs
# diff introduced by the release-docs merge and the code diff between the
# previous and current release tags, then emits a decision for the workflow.
#
# Criteria (from the GTM Asset Automation plan):
#   YES — generate: new feature/module, new/changed workflow, changed steps,
#         visual change on screen, side-nav updates
#   NO  — no_asset: minor text/label change, design-system updates,
#         backend-only changes, nested UI changes
#
# Ambiguous cases fall through to the skill (Layer 2) to decide.
#
# Output: Appends `key=value` lines to stdout, one per line, intended to be
# redirected into $GITHUB_OUTPUT by the caller:
#   decision=generate|no_asset|ambiguous
#   criterion=new_feature|new_flow|changed_steps|visual_change|sidebar_nav|
#             minor_text|design_system|backend_only|nested_ui|ambiguous|manual_override
#   evidence=<single-line human-readable summary>
#   docs_md_count=<int>
#   docs_new_pages=<int>
#   docs_nav_changed=<0|1>
#   docs_theme_only=<0|1>
#   fe_component_count=<int>
#   fe_style_only=<0|1>
#   md_line_delta=<int>
#
# Usage:
#   classify-release-changes.sh --tag X.Y.Z --prev A.B.C \
#     --docs-dir <path> --docs-sha <sha> --code-dir <path>

set -euo pipefail

TAG=""; PREV=""; DOCS_DIR=""; DOCS_SHA=""; CODE_DIR=""
while [ $# -gt 0 ]; do
  case "$1" in
    --tag)       TAG="$2"; shift 2;;
    --prev)      PREV="$2"; shift 2;;
    --docs-dir)  DOCS_DIR="$2"; shift 2;;
    --docs-sha)  DOCS_SHA="$2"; shift 2;;
    --code-dir)  CODE_DIR="$2"; shift 2;;
    *) echo "::error::Unknown arg: $1" >&2; exit 2;;
  esac
done
for v in TAG DOCS_DIR CODE_DIR; do
  if [ -z "${!v}" ]; then echo "::error::Missing --${v,,}" >&2; exit 2; fi
done

log() { echo "$*" >&2; }

# ---- Patterns. Keep these conservative; tighten as real releases teach us.
DOCS_THEME_RE='^(overrides/|stylesheets/|theme/|assets/.*\.(css|svg|png|jpg|jpeg|woff2?|ico)$)'
# Front-end component files that can change what's on screen in a video.
FE_COMPONENT_RE='\.(tsx|jsx|vue|svelte|html|htm)$'
# Front-end style-only files.
FE_STYLE_RE='\.(css|scss|sass|less)$|\.module\.css$'
# Nested-UI hints in docs paths (More menu, row actions, dropdowns, etc.).
NESTED_UI_HINT_RE='(more-menu|row-actions?|dropdown|overflow-menu|kebab-menu)'
# Threshold below which an md-only change is treated as "minor text".
MINOR_TEXT_LINE_BUDGET=20

# ---- Docs diff introduced by the merge commit.
docs_md_count=0
docs_new_pages=0
docs_nav_changed=0
docs_theme_only=0
md_line_delta=0
docs_total_changed=0
docs_nested_hint=0

if [ -n "$DOCS_SHA" ]; then
  log "Docs diff: parent1 of $DOCS_SHA .. $DOCS_SHA"
  DOCS_BASE="$(git -C "$DOCS_DIR" rev-parse "${DOCS_SHA}^1" 2>/dev/null || true)"
  if [ -z "$DOCS_BASE" ]; then
    log "::warning::$DOCS_SHA has no first parent (not a merge). Falling back to HEAD~1."
    DOCS_BASE="$(git -C "$DOCS_DIR" rev-parse "${DOCS_SHA}~1" 2>/dev/null || true)"
  fi
  if [ -n "$DOCS_BASE" ]; then
    mapfile -t DOCS_CHANGED < <(git -C "$DOCS_DIR" diff --name-only "$DOCS_BASE..$DOCS_SHA")
    mapfile -t DOCS_ADDED   < <(git -C "$DOCS_DIR" diff --name-only --diff-filter=A "$DOCS_BASE..$DOCS_SHA")
    docs_total_changed=${#DOCS_CHANGED[@]}
    for f in "${DOCS_CHANGED[@]:-}"; do
      [ -z "$f" ] && continue
      case "$f" in *.md) docs_md_count=$((docs_md_count+1));; esac
      [ "$f" = "mkdocs.yml" ] && docs_nav_changed=1
      echo "$f" | grep -qiE "$NESTED_UI_HINT_RE" && docs_nested_hint=$((docs_nested_hint+1)) || true
    done
    for f in "${DOCS_ADDED[@]:-}"; do
      [ -z "$f" ] && continue
      case "$f" in *.md) docs_new_pages=$((docs_new_pages+1));; esac
    done
    # Theme-only = something changed, no .md, no mkdocs.yml, every file matches theme regex.
    if [ "$docs_total_changed" -gt 0 ] && [ "$docs_md_count" -eq 0 ] && [ "$docs_nav_changed" -eq 0 ]; then
      theme_only=1
      for f in "${DOCS_CHANGED[@]}"; do
        [ -z "$f" ] && continue
        if ! echo "$f" | grep -qE "$DOCS_THEME_RE"; then theme_only=0; break; fi
      done
      docs_theme_only=$theme_only
    fi
    if [ "$docs_md_count" -gt 0 ]; then
      md_line_delta="$(
        git -C "$DOCS_DIR" diff --numstat "$DOCS_BASE..$DOCS_SHA" -- '*.md' 2>/dev/null \
          | awk '{sum+=$1+$2} END{print sum+0}'
      )"
    fi
  else
    log "::warning::Could not resolve docs merge base; treating docs diff as empty."
  fi
else
  log "No docs_sha provided; skipping docs diff (will treat as no docs changes)."
fi

# ---- Code diff between tags.
fe_component_count=0
fe_style_only=0
code_total_changed=0

if [ -n "$PREV" ]; then
  PREV_REF=""
  for ref in "$PREV" "v$PREV" "refs/tags/$PREV" "refs/tags/v$PREV"; do
    if git -C "$CODE_DIR" rev-parse -q --verify "$ref" >/dev/null 2>&1; then
      PREV_REF="$ref"; break
    fi
  done
  CUR_REF=""
  for ref in "$TAG" "v$TAG" "refs/tags/$TAG" "refs/tags/v$TAG"; do
    if git -C "$CODE_DIR" rev-parse -q --verify "$ref" >/dev/null 2>&1; then
      CUR_REF="$ref"; break
    fi
  done

  if [ -n "$PREV_REF" ] && [ -n "$CUR_REF" ]; then
    log "Code diff: $PREV_REF .. $CUR_REF"
    mapfile -t CODE_CHANGED < <(git -C "$CODE_DIR" diff --name-only "$PREV_REF..$CUR_REF")
    code_total_changed=${#CODE_CHANGED[@]}
    style_count=0
    for f in "${CODE_CHANGED[@]:-}"; do
      [ -z "$f" ] && continue
      if echo "$f" | grep -qE "$FE_COMPONENT_RE"; then
        fe_component_count=$((fe_component_count+1))
      fi
      if echo "$f" | grep -qE "$FE_STYLE_RE"; then
        style_count=$((style_count+1))
      fi
    done
    if [ "$fe_component_count" -eq 0 ] && [ "$style_count" -gt 0 ] && [ "$style_count" -eq "$code_total_changed" ]; then
      fe_style_only=1
    fi
  else
    log "::warning::Could not resolve one of ($PREV, $TAG) to a code ref. Treating code diff as unknown."
  fi
else
  log "No previous tag; treating code diff as unknown."
fi

# ---- Decide.
decision="ambiguous"
criterion="ambiguous"
evidence="Docs changed but no deterministic rule matched; handing to skill."

if [ "$docs_total_changed" -eq 0 ] && [ "$code_total_changed" -eq 0 ]; then
  decision="no_asset"; criterion="backend_only"
  evidence="No docs or front-end files changed between $PREV and $TAG."
elif [ "$docs_total_changed" -eq 0 ] && [ "$fe_component_count" -eq 0 ]; then
  decision="no_asset"; criterion="backend_only"
  evidence="Code changes present ($code_total_changed files) but no docs and no front-end components."
elif [ "$docs_theme_only" -eq 1 ] && [ "$fe_component_count" -eq 0 ]; then
  decision="no_asset"; criterion="design_system"
  evidence="Only docs theme/style files changed and no front-end components touched."
elif [ "$docs_nav_changed" -eq 1 ]; then
  decision="generate"; criterion="sidebar_nav"
  evidence="mkdocs.yml changed; sidebar navigation may be affected."
elif [ "$docs_new_pages" -gt 0 ]; then
  decision="generate"; criterion="new_feature"
  evidence="$docs_new_pages new docs page(s) added in release $TAG."
elif [ "$fe_component_count" -gt 0 ] && [ "$md_line_delta" -gt "$MINOR_TEXT_LINE_BUDGET" ]; then
  decision="generate"; criterion="visual_change"
  evidence="$fe_component_count front-end component file(s) changed with $md_line_delta lines of docs edits."
elif [ "$fe_component_count" -gt 0 ] && [ "$docs_nested_hint" -gt 0 ] && [ "$md_line_delta" -le "$MINOR_TEXT_LINE_BUDGET" ]; then
  decision="no_asset"; criterion="nested_ui"
  evidence="Small front-end + docs change referencing nested UI (e.g. More menu / row actions)."
elif [ "$fe_component_count" -eq 0 ] && [ "$fe_style_only" -eq 1 ] && [ "$md_line_delta" -le "$MINOR_TEXT_LINE_BUDGET" ]; then
  decision="no_asset"; criterion="design_system"
  evidence="Style-only front-end changes and <= $MINOR_TEXT_LINE_BUDGET lines of docs edits."
elif [ "$docs_md_count" -gt 0 ] && [ "$docs_nav_changed" -eq 0 ] && [ "$docs_new_pages" -eq 0 ] && [ "$md_line_delta" -le "$MINOR_TEXT_LINE_BUDGET" ] && [ "$fe_component_count" -eq 0 ]; then
  decision="no_asset"; criterion="minor_text"
  evidence="$docs_md_count docs page(s) changed, $md_line_delta total lines; no new pages, nav, or front-end."
elif [ "$docs_md_count" -gt 0 ] && [ "$md_line_delta" -gt "$MINOR_TEXT_LINE_BUDGET" ]; then
  decision="generate"; criterion="changed_steps"
  evidence="$docs_md_count docs page(s) changed, $md_line_delta lines; likely flow or step changes."
fi

# ---- Emit outputs.
printf 'decision=%s\n'            "$decision"
printf 'criterion=%s\n'           "$criterion"
printf 'evidence=%s\n'            "$evidence"
printf 'docs_md_count=%s\n'       "$docs_md_count"
printf 'docs_new_pages=%s\n'      "$docs_new_pages"
printf 'docs_nav_changed=%s\n'    "$docs_nav_changed"
printf 'docs_theme_only=%s\n'     "$docs_theme_only"
printf 'fe_component_count=%s\n'  "$fe_component_count"
printf 'fe_style_only=%s\n'       "$fe_style_only"
printf 'md_line_delta=%s\n'       "$md_line_delta"
