---
description: >-
  Set weekly hours and closure periods on items with Hours of Operation and
  Closure fields.
---

# Managing Hours of Operation and Closures

Entities can include **Hours of Operation** and **Closure** fields in their schema. You set their values per item from the item's editing tray: hours as weekly open/closed rules with time ranges, and _closures_ as dated periods — such as holidays — when normal hours don't apply.

Each field's heading in the editing tray shows its field name (for example, "Chat hours" or "Holiday closures"), so entities with more than one Hours of Operation or Closure field are distinguishable at a glance. A field with no name falls back to a generic heading — "Hours of Operation," or a count-based heading such as "2 Closures."

***

## Before You Begin

* You need item edit permission on the entity. See Managing DFC Permissions.
* The entity's schema must include an Hours of Operation or Closure field. See Setting Up Entities and Schemas.
* Changes are submitted as a change request and take effect once approved.
* Times are entered and displayed in UTC.

***

## Editing an Item's Hours of Operation

The editing tray opens fully editable — there's no separate edit mode. The footer keeps **Cancel** and **Save** visible while you scroll, and **Save** enables as soon as you make a change.

1. Open the item from the items table.
2. Toggle a day on to set its hours. Editable start and end times appear.
3. Toggle a day off to mark it **Closed**.
4. (Optional) Add more time ranges to a day: a. Click the **+** next to the day. The **Edit Hours of Operation** modal opens with a weekly calendar view. b. Add or adjust ranges in the calendar. c. Save the modal. Additional ranges appear nested under their day, where you can edit them directly.
5. Click **Save** and review your changes (see Reviewing and Submitting Your Changes below).

***

## Adding or Deleting Closures

1. Open the item from the items table.
2. Click **+ Closure**.
3. Enter the closure's title, start, and end, and an optional description.
4. To remove an existing closure, click its delete button.
5. Click **Save** and review your changes (see Reviewing and Submitting Your Changes below).

{% hint style="info" %}
**Note:** When the list has more than three closures, a second + Closure button appears at the bottom of the list so you don't have to scroll back to the top.
{% endhint %}

***

## Reviewing and Submitting Your Changes

1. Click **Save**. The **Are you sure?** dialog lists every pending change, such as "Set Hours → 7 rules (UTC)."
2. (Optional) Enter a **Change Request Description**.
3. Set the **Change Request Criticality**. The default is **Normal**.
4. (Optional) Set **Schedule For Later** to schedule the change.
5. Click **Yes, Submit Changes**.

A change request is created and routed through the standard DFC approval flow. Your changes apply once it's approved.

{% hint style="info" %}
**Note:** An item with no hours and no closures opens with every day showing Closed and a single blank closure card ready to fill in.
{% endhint %}

***

## Support

If you run into issues not covered here, contact the support team through the [**Support**](https://pronetx.gitbook.io/cxportal-1/M6apoD9LCAkiMWFcxuXH/submitting-a-support-request) page.

***
