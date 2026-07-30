# CxPortal Documentation

The **external, customer-facing** documentation for CxPortal — the user guides customers read to use the CxPortal's modules (DFC, Campaigns, ACGR, Knowledge Management, Proficiency-Based Routing, and more).

Built with [MkDocs](https://www.mkdocs.org/) and published to **[docs.caylent.com/cxportal](https://docs.caylent.com/cxportal/)**. Migrated from GitBook.

## Editing

Edit the Markdown under `docs/` and open a PR. GitHub Actions publishes a
preview at:

```text
https://docs.caylent.com/previews/pr-<number>/
```

The PR includes a **View deployment** link. Each new commit replaces that PR's
preview, and closing or merging the PR removes it. Merging to `main` publishes
the production site.

## Run locally

```bash
pip install --requirement requirements.txt
mkdocs serve   # preview at http://127.0.0.1:8000
```

## Hosting

The site is stored in a private S3 bucket and served through CloudFront. GitHub
Actions authenticates to AWS with OIDC; GitHub Pages is not used.
