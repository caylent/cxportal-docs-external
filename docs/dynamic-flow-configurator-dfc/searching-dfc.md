# Searching DFC

## Before You Begin

* You need a DFC permission level (**Admin** or **User**) assigned to your account, the same as for browsing DFC. See [Managing DFC Permissions](managing-dfc-permissions.md).
* Search covers the entities and items your account has access to; DFC still enforces your existing entity-tag and permission restrictions.

***

## Step-by-Step Instructions

### Search DFC

1. In the DFC header, click the search bar (labeled **Search DFC**) and type your search term. You need at least 2 characters before a search runs.
2. Press Enter
3. Results are grouped into two sections:
    - **Items** — matching records inside entities
    - **Entities** — matching entities and sub-entities
4. Each section header shows a result count summary. If DFC hasn't finished scanning your data yet, the summary reflects that instead of showing an empty result.
5. Click **Load more** (or **Continue searching**) at the bottom of a section to fetch the next page of results.

!!! info ""
    **Note:** Search looks across your whole DFC instance, not just the entity or folder you were browsing when you opened it — searching from inside a specific entity doesn't narrow the results to that entity.

***

### Troubleshooting

| Problem | Cause | Solution |
| --- | --- | --- |
| The Search Results page shows "You don't have access to DFC." | Your role doesn't currently have a DFC permission level assigned. | Contact your Access Management admin to have a DFC permission level added to your role. |
| The Search Results page shows "Something went wrong loading results." | The search request failed to load. | Try the search again. If it keeps failing, submit a support request. |

!!! info ""
    [VERIFY] The exact wording of the in-progress-scan messaging (shown while DFC is still checking your data for matches) and the parent-entity context line shown under an item result are confirmed in the code but not independently verified against a live search — check both against the running UI before publishing.

***
