# CxPortal module one-pager

A one-page leave-behind for any CxPortal module. Sales picks a module, edits the lines that should sound like the account, and prints a PDF.

The page uses Caylent’s public brand: deep space `#101010`, galaxy green `#97CA6F` and `#CBEFAE`, galaxy ink `#1B350A`, moon shadow `#FAF7F2`, and Roboto. It is a sales asset. It lives outside `docs/`, so it is not published to the customer documentation site.

## Open it

Open `cxportal-module-one-pager.html` in Chrome. Keep this folder together. The typeface is `fonts/roboto-latin.woff2`.

The module menu loads starter copy drawn from the product guides:

- Dynamic Flow Configurator
- Flow Analyzer
- Amazon Connect Global Resiliency
- Knowledge Management
- Q in Connect
- Workforce Management
- Campaigns
- Proficiency-Based Routing
- Agent Batch Editor
- Change Management
- Access Management
- CxCases
- Pinpoint Migration Tool

**Blank template** clears the page back to field prompts. Use it for a module that is not in the list.

Click any line to edit it. Account name, your name, and the date stay put when you switch modules. Switching modules replaces the other lines. If you have edited them, the page asks before it clears your work.

## Print

The bar at the top must read **Fits on one page** before you print. If it says the page is too long, shorten a field. Do not shrink the type.

In the print dialog:

- Paper size: Letter
- Scale: 100
- Margins: None
- Background graphics: On
- Headers and footers: Off

Save as PDF and send the PDF.

## How to write a module

Each block has one job:

| Block | What to put there |
| --- | --- |
| Category | The buyer’s world, such as Resiliency or Workforce. A few words. |
| Module name | The name customers see. |
| Headline | One sentence the buyer could repeat. The result, not a feature list. |
| The situation | Three lines on how the work happens today. |
| What changes | Two or three sentences on what the buyer’s team can do once the module is in. |
| What your team can do | Four capabilities. A short title and one line each. |
| Who it’s for | Up to three roles, and why each one cares. |
| Why it matters | Three business results. No invented metric. |
| Closing line | Where the module sits: CxPortal on Amazon Connect, or a plain description if it is a different Caylent tool. |

To add a module to the menu, add an object to the `MODULES` list in `cxportal-module-one-pager.html`, using the same fields as the entries already there.

## Rules

- Stay on one page.
- Put a number on the page only when it is this customer’s figure, or a figure already approved for external use.
- Read starter copy against the account before you send it. Workforce Management depends on Amazon Connect Forecasting, Capacity Planning, and Scheduling. The Pinpoint Migration Tool is a command-line product on AWS Marketplace, not a screen inside CxPortal. CxCases is support-request tracking in CxCentral.
- The coaching notes under the page do not print.
