# Viewing Release Notes

CxPortal keeps published release notes in the portal, so you can check what shipped, when it shipped, and whether it needs any action from your team. Start from the **Release Notes** widget on the homepage, or open the **Release Notes** page to browse the full history.

For what each release type means for your team, see [Releases & Updates.](https://docs.caylent.com/cxportal/releases-and-updates/)

***

## Opening Release Notes

* **From the homepage widget** — the **Release Notes** widget lists the most recent releases, newest first. Click an entry to open that release note, or click **All** to open the Release Notes page. 
* **From a release note** — click **Release Notes** in the breadcrumb at the top of the page.

The Release Notes page is read-only and open to every CxPortal user. There is nothing to create, edit, publish, or delete.

***

## Browsing the Release Notes Page

The Release Notes page lists every published release note, newest first. The heading above the list tells you how many notes you are looking at and the count updates as you search and filter.

Each row shows:

* The release date
* The release title
* The release type as a **Type 1**, **Type 2**, or **Type 3** with a label — **No action required**, **Permission assignment**, or **Infrastructure update**
* A preview of the release notes. Select **more** to view the full text.

**Note:** To change the order, click **Release Date** above the list. It switches between newest first (the default) and oldest first.

***

## Searching and Filtering

To search, enter text in **Search Notes** above the list. Search matches the release title and the summary text, and matches in the title are highlighted. Markdown formatting and link addresses inside a summary are not searched.

Use the **Filters** on the left to narrow the list further:

| Filter      | What it does                                                                                                                                                   |
| ----------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Date**    | Limits the list to releases published in a date range. Choose **Last 30 days**, **Last 90 days**, **This Year**, or pick your own range.                       |
| **Type**    | Limits the list to one or more release types: **Type 1 · No action required**, **Type 2 · Permission assignment**, **Type 3 · Infrastructure update**.         |
| **Module**  | Limits the list to releases that affect the modules you select.                      |

**Important Notes:**

* Your search and your filters combine. A release note has to match the search text and every filter you set to appear in the search results.

* Click **Clear Filters** to clear the Date, Type, and Module filters. Your search text stays, so you can start over on the filters without retyping it.

* Your search text and your Type and Module selections are remembered the next time you open the page. The Date filter is not remembered.

* If nothing matches, the list shows **No release notes match your search or filters.** 

* If the list can't be loaded, the page shows **Failed to load release notes** with a **Retry** button.

***

## Reading a Release Note

A release note opens on a new page and shows:

* The release title, with the release date beneath it
* A banner naming the release type and the action it requires — **Type 1 No action required**, **Type 2 Permission assignment**, or **Type 3 Infrastructure update**
* The modules the release affects, with their versions
* The full release details

The side panel holds:

* **Deployment Instructions:** Always shown, so you can quickly tell whether the release requires action from you. If instructions exist, read them directly in the panel. If none are needed, the panel displays There are no deployment instructions for this release.
* **Downloads:** Lists any files attached to the release (when applicable).

To look through releases without going back to the list, use **Previous** and **Next** at the top of the page. **Previous** opens the next older release note and **Next** opens the next newer one. They move through all published release notes rather than the ones currently matching your filters.

