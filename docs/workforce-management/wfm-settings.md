# Reviewing Workforce Management Settings

The **Settings** page shows the instance-level configuration every other Workforce Management view reads from: which agents are counted in Workforce Management figures, the adherence and conformance targets those figures are classified against, and the display defaults the views open with.

## Before You Begin

- An Amazon Connect instance must be selected in the **Instance** selector. Without one, the page reports *No Connect instance selected.*
- Your role must carry the Workforce Management **admin** permission for the Program Dashboard. A reader or writer sees neither the page nor its sidebar entry. [VERIFY: the page is gated on the same permission as the Program Dashboard's admin tier — confirm the label your administrators see for it in Access Management]

## Limits and Constraints

- The page is read-only in this release. Every control is disabled, and an information callout reads *These settings are read-only. Changing them is a Connect or support task until saving from the portal ships.*
- Security profiles are identified by id, not by name — profile names are not available to the page yet
- The **Performance thresholds** card shows the same values as the Program Dashboard's settings shortcut, so the two cannot disagree
- When the settings record cannot be read, the page still opens: a warning names the failure, and no profile can be marked counted or not counted

## Step-by-Step Instructions

### Opening the Page

1. Confirm the correct Amazon Connect instance is selected in the **Instance** selector.
2. In the left sidebar, click **Workforce Management**, then **Settings**.

### Checking Which Agents Are Counted

The **Reporting population** card answers which of the instance's agents appear in Workforce Management figures. Agents carrying a counted security profile appear in every Workforce Management roster, adherence, and conformance figure. Agents on every other profile are excluded from all of them.

1. Read the headline — *n of m agents counted*. Where the counted-profile list cannot be read, the headline reads *m agents on this instance* instead, followed by *The counted-profile list could not be read, so no profile can be marked counted or not counted.*
2. Read the table. It lists every security profile the instance reports, not only the counted ones, so a profile nobody counts is visible rather than absent:

| Column | What it shows |
| --- | --- |
| **Security profile id** | The Amazon Connect security profile id |
| **Agents** | How many agents on the instance carry that profile |
| **Status** | **Counted** when the profile is on the counted list, **Not counted** when it is not, and **Unknown** when the list could not be read |

3. Check the line beneath the headline for agents outside every profile. Where any agent carries no security profile at all, the page says how many and notes that they are counted by nothing.

!!! info ""

    Profile names are not available to this page yet, so profiles are identified by id. Match them in the Amazon Connect console under **Users**, then **Security profiles**.

An instance that reports no profiles at all reads *No security profiles were found on this instance.*, and an agent directory that cannot be read reads *Could not read the agent directory for this instance.*

### Checking the Performance Thresholds

The **Performance thresholds** card shows the adherence and conformance targets every Workforce Management view classifies against. The Program Dashboard's gear opens the same settings as a shortcut, so you can read them from either place.

- **Adherence** — **Target %** and **At-risk floor %**
- **Conformance** — a **Set a conformance target** toggle, with **Target %** and **At-risk floor %** beneath it. With the toggle off, conformance is shown as a measurement only, with no On Target or At Risk status.

!!! info ""

    A threshold pair must read `0 < at-risk floor < target ≤ 100`. Where it does not, the card names what is wrong rather than rejecting the value silently — *Enter numeric percentages.*, *At-risk floor must be greater than 0%.*, *Target cannot exceed 100%.*, or *At-risk floor must be less than the target.*

### Checking the Display Defaults

The **Display defaults** card shows the time zone Workforce Management views open in, and the tolerance either side of a scheduled activity before an agent counts as out of adherence.

- **Default time zone** — the time zone the views open in, until a viewer chooses another
- **Adherence grace minutes** — the grace tolerance applied either side of a scheduled activity

## Related Pages

- [Monitoring the Program Dashboard](wfm-program-dashboard.md) — where the thresholds are applied
- [Monitoring Live Agent Status](wfm-monitor-agent-status.md) — the roster the reporting population scopes
- [Workforce Management Reference](wfm-reference.md) — the field-by-field summary of this page
