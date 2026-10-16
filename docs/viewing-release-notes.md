---
description: >-
  Every published CxPortal release note is available in the portal. This page
  explains how to open release notes from the homepage, how to search and filter
  the Release Notes page, and what an individual release note shows you.
---

# Viewing Release Notes

CxPortal keeps every published release note in the portal, so you can check what shipped, when it shipped, and whether it needs anything from your team. Start from the **Release Notes** widget on the homepage, or open the **Release Notes** page to browse the full history.

For what each release type means for your team, see [Releases & Updates →](https://docs.caylent.com/cxportal/releases-and-updates/)

***

## Opening Release Notes

* **From the homepage widget** — the **Release Notes** widget lists the most recent releases, newest first. Click an entry to open that release note, or click **All** to open the Release Notes page. The **All** link appears only when at least one release note has been published.
* **From a release note** — click **Release Notes** in the breadcrumb at the top of the page.

!!! info ""
    The Release Notes page is read-only and open to every CxPortal user. There is nothing to create, edit, publish, or delete here.

***

## Browsing the Release Notes Page

The Release Notes page lists every published release note, newest first. The heading above the list tells you how many notes you are looking at — for example **All CxPortal Release Notes • 24** — and the count updates as you search and filter.

Each row shows:

* The release date
* The release title
* The release type as a **Type 1**, **Type 2**, or **Type 3** pill with its short label — **No action required**, **Permission assignment**, or **Infrastructure update**
* A one-line summary, ending with **more**

Click a row to open the full release note.

To change the order, click **Release Date** above the list. It switches between newest first (the default) and oldest first.

***

## Searching and Filtering

To search, enter text in **Search Notes** above the list. Search matches the release title and the summary text, and matches in the title are highlighted. Markdown formatting and link addresses inside a summary are not searched.

Use the **Filters** rail on the left to narrow the list further:

| Filter      | What it does                                                                                                                                                   |
| ----------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Date**    | Limits the list to releases published in a date range. Choose **Last 30 days**, **Last 90 days**, **This Year**, or pick your own range.                       |
| **Type**    | Limits the list to one or more release types: **Type 1 · No action required**, **Type 2 · Permission assignment**, **Type 3 · Infrastructure update**.         |
| **Module**  | Limits the list to releases that affect the modules you select. The options come from the modules named in the release notes themselves.                       |

Your search and your filters combine: a release note has to match the search text and every filter you set to stay in the list.

Click **Clear Filters** to clear the Date, Type, and Module filters. Your search text stays, so you can start over on the filters without retyping it.

Your search text and your Type and Module selections are remembered the next time you open the page. The Date filter is not remembered.

If nothing matches, the list shows **No release notes match your search or filters.** If no release notes have been published at all, it shows **No release notes yet**.

!!! info ""
    If the list can't be loaded, the page shows **Failed to load release notes** with a **Retry** button.

***

## Reading a Release Note

A release note opens on its own page and shows:

* The release title, with the release date beneath it
* A breadcrumb back to **Release Notes**
* A banner naming the release type and the action it requires — **Type 1 No action required**, **Type 2 Permission assignment**, or **Type 3 Infrastructure update**
* The modules the release affects, with their versions
* The full release details

The side panel holds:

* **Deployment Instructions** — always present, so you can see at a glance whether the release needs work in your AWS account. When the release ships instructions, you can read them straight from the panel; when it doesn't, the panel shows *There are no deployment instructions for this release.*
* **Downloads** — the files attached to the release, when it has any.

To step through releases without going back to the list, use **Previous** and **Next** at the top of the page. **Previous** opens the next older release note and **Next** opens the next newer one. They step through all published release notes rather than the ones currently matching your filters, and each button is disabled when there is nothing to step to.

!!! info ""
    If a release note has been removed or isn't published, the page shows **Release note not found** with a **View all release notes** link back to the list.

***

## Next Steps

* **Admins:** [Enabling New Features with Permissions →](https://docs.caylent.com/cxportal/enabling-new-features-with-permissions/)
* **Deployment teams:** [Applying an Infrastructure Update →](https://docs.caylent.com/cxportal/applying-an-infrastructure-update/)

***
