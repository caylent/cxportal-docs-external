# CxPortal Documentation

The **external, customer-facing** documentation for CxPortal — the user guides customers read to use the Cxportal's modules (DFC, Campaigns, ACGR, Knowledge Management, Proficiency-Based Routing, and more).

Built with [MkDocs](https://www.mkdocs.org/) and published to **[docs.caylent.com/cxportal](https://docs.caylent.com/cxportal/)**. Migrated from GitBook.

## Editing

Edit the Markdown under `docs/`, open a PR, and merge to `main` — GitHub Actions builds and publishes automatically.

## Run locally

```bash
pip install mkdocs
mkdocs serve   # preview at http://127.0.0.1:8000
```

## Note

Pages must deploy via **GitHub Actions** (Settings → Pages → Source), not the legacy Jekyll builder.
