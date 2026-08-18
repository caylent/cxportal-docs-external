# Contributing to the CxPortal documentation

## Renaming or moving a page? Add a redirect.

MkDocs builds each page's public URL from its file path under `docs/`. That
means **renaming or moving any `.md` file changes its URL** and breaks every
existing link and bookmark that pointed at the old location — internal links,
links in emails and support tickets, and users' saved bookmarks.

This site uses [`mkdocs-redirects`](https://github.com/mkdocs/mkdocs-redirects)
to preserve old URLs. **Whenever you rename or move a page, you must add a
redirect** so the old URL keeps working.

### How to add a redirect

1. Open `mkdocs.yml`.
2. Under `plugins:` → `- redirects:` → `redirect_maps:`, add one line mapping
   the **old** path to the **new** path (both relative to `docs/`, with the
   `.md` extension):

   ```yaml
   redirect_maps:
     'old/path.md': 'new/path.md'
   ```

   Example — moving the Schedules page into the Administration folder:

   ```yaml
   'schedules.md': 'administration/schedules.md'
   ```

3. Update any `nav:` entries that referenced the old path.
4. Build locally (`mkdocs build`) and confirm the old URL now serves a small
   "Redirecting…" page that forwards to the new one.

### Rules of thumb

- The **left side** is the path that no longer exists (the file you removed or
  renamed). The **right side** is where the content now lives.
- **Never delete old entries.** Links live on long after a page moves, so
  redirects are kept indefinitely. Removing one re-breaks those links.
- One entry per move. If a page moves twice, point the oldest URL at the
  newest location (don't chain redirects).

## Build requirements

Build-time dependencies live in `requirements.txt` at the repo root and are
installed in CI by `.github/workflows/deploy-docs.yml`. Add any new MkDocs
plugin there so local builds and CI stay in sync.
