#!/usr/bin/env bash
# Lives in the CODE repo at .github/workflows/scripts/slack-notify.sh.
#
# Post one of four message types to the GTM-assets Slack channel. All types
# post to the same channel so every outcome is auditable in one place:
#
#   draft            — Layer-1 gate said generate and the skill produced a draft.
#   no_asset_gate    — Layer-1 gate short-circuited to no_asset.
#   no_asset_skill   — Layer-1 gate said generate|ambiguous but the skill
#                      decided no_asset after reading the diff.
#   failure          — Any job in the workflow failed.
#
# Requires env:
#   SLACK_BOT_TOKEN, SLACK_CHANNEL_ID, TAG, RUN_URL
# Optional per-type:
#   DOCS_PR, GATE_CRITERION, GATE_EVIDENCE, SKILL_CRITERION, SKILL_EVIDENCE

set -euo pipefail

TYPE="${1:-}"
case "$TYPE" in
  draft|no_asset_gate|no_asset_skill|failure) ;;
  *) echo "::error::slack-notify.sh: unknown type '$TYPE'" >&2; exit 2;;
esac

: "${SLACK_BOT_TOKEN:?SLACK_BOT_TOKEN is required}"
: "${SLACK_CHANNEL_ID:?SLACK_CHANNEL_ID is required}"
: "${TAG:?TAG is required}"
: "${RUN_URL:?RUN_URL is required}"

docs_pr_line=""
if [ -n "${DOCS_PR:-}" ]; then
  docs_pr_line="Docs PR: #${DOCS_PR}"
fi

case "$TYPE" in
  draft)
    header=":movie_camera: *New GTM draft — release ${TAG}*"
    body="$(cat <<MSG
${header}
Trigger (gate): \`${GATE_CRITERION:-unknown}\` — ${GATE_EVIDENCE:-}
Skill: \`${SKILL_CRITERION:-generate}\` — ${SKILL_EVIDENCE:-}
${docs_pr_line}
Artifacts and run: <${RUN_URL}|open run>
Please review and reply in-thread. The old asset stays in Drive until this draft is approved.
MSG
)"
    ;;
  no_asset_gate)
    header=":information_source: *No asset recommended — release ${TAG}*"
    body="$(cat <<MSG
${header}
Reason (gate): \`${GATE_CRITERION:-unknown}\` — ${GATE_EVIDENCE:-}
${docs_pr_line}
Run: <${RUN_URL}|open run>
Reply in-thread if you believe this release should still get an asset and I'll re-run with \`force=true\`.
MSG
)"
    ;;
  no_asset_skill)
    header=":information_source: *No asset recommended (skill decision) — release ${TAG}*"
    body="$(cat <<MSG
${header}
Trigger (gate): \`${GATE_CRITERION:-unknown}\` — ${GATE_EVIDENCE:-}
Skill decision: \`${SKILL_CRITERION:-no_asset}\` — ${SKILL_EVIDENCE:-}
${docs_pr_line}
Run: <${RUN_URL}|open run>
Reply in-thread to override.
MSG
)"
    ;;
  failure)
    header=":warning: *Release video workflow failed — ${TAG}*"
    body="$(cat <<MSG
${header}
Run: <${RUN_URL}|open run>
Nothing was posted to reviewers. Check the run log, then re-run via workflow_dispatch.
MSG
)"
    ;;
esac

payload="$(jq -nc \
  --arg channel "$SLACK_CHANNEL_ID" \
  --arg text "$body" \
  '{channel:$channel, text:$text, unfurl_links:false, unfurl_media:false}')"

response="$(
  curl --fail-with-body --silent --show-error \
    -X POST https://slack.com/api/chat.postMessage \
    -H "Authorization: Bearer ${SLACK_BOT_TOKEN}" \
    -H "Content-Type: application/json; charset=utf-8" \
    --data "$payload"
)"

ok="$(printf '%s' "$response" | jq -r '.ok')"
if [ "$ok" != "true" ]; then
  echo "::error::Slack post failed: $response" >&2
  exit 1
fi

ts="$(printf '%s' "$response" | jq -r '.ts')"
echo "Posted to Slack (channel=${SLACK_CHANNEL_ID}, ts=${ts})."

# For draft posts, upload every asset in out/assets/ as a thread reply, so
# reviewers see the files inline without downloading the artifact zip.
if [ "$TYPE" = "draft" ] && [ -d "out/assets" ]; then
  shopt -s nullglob
  for f in out/assets/*; do
    [ -f "$f" ] || continue
    echo "Uploading $f to Slack thread $ts..."
    curl --fail-with-body --silent --show-error \
      -X POST https://slack.com/api/files.upload \
      -H "Authorization: Bearer ${SLACK_BOT_TOKEN}" \
      -F "channels=${SLACK_CHANNEL_ID}" \
      -F "thread_ts=${ts}" \
      -F "file=@${f}" \
      -F "initial_comment=Asset: $(basename "$f")" >/dev/null || {
        echo "::warning::Failed to upload $f to Slack; see artifact zip on the run."
      }
  done
fi
