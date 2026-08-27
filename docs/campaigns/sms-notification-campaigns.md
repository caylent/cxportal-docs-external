# SMS Notification Campaigns

## Before You Begin

An SMS Notification Campaign sends one-way text messages directly to mobile devices. Ideal for reminders and announcements.

Before creating an SMS Notification campaign, make sure you have the following in place:

* **The right permissions** — Campaigns use role-based access, so you'll need the specific role your organization assigns in order to create one.
* **A Campaign Group** — Every campaign must belong to a group. If you don't already have one, create a Campaign Group first.
* **An SMS-capable phone number** — You'll select a source phone number for the campaign, and it must be a number that supports SMS.
* **Your message content** — Have the text of your notification ready. You can add multiple sequential messages with wait periods in between if needed.
* **A contact list** — Prepare a CSV file with your recipients' details, formatted to meet the upload requirements.

***

## Limits and Constraints

Keep the following limits in mind when building an SMS Notification campaign:

* **One-way messaging** — SMS Notifications send one-way text messages and don't collect responses; they're ideal for reminders and announcements rather than feedback.
* **500-character limit** — Each notification message is limited to 500 characters.
* **SMS-capable source number** — You can only choose a phone number that supports SMS.
* **Campaign name rules** — Names must start with a letter or number, may contain only letters, numbers, hyphens, or underscores (no spaces), and must be unique across all past and future campaigns.
* **Language options** — English is selected by default, with Spanish available as an additional language.
* **Contact list format** — The file must be a CSV containing first\_name, last\_name, and phone\_number columns (all values required), with phone numbers starting with + and containing at least 11 digits. An optional language column accepts en-US, es-US, or an empty value.
* **Campaign duration** — Per the campaign duration guidelines, recommended durations depend on the type of message: up to 24 hours for emergency alerts, up to 7 days for service notifications, and up to 14 days for general communications.
* **Post-campaign retention** — After a campaign ends, it stays on the dashboard for two months before its associated resources are removed from Amazon Connect; campaign metrics are retained.

***

## Step-by-Step Instructions

### Create an SMS Notification Campaign

1.   In the left menu, click **Campaigns**, and then **Dashboard**.
2.   Click **+ Create Campaign**.
3. Select a **Campaign Group**. A group must be selected before you can proceed. Campaigns can’t be created without a group.
4. Click **SMS Notification**, and then **Content**.
5. Enter a **Campaign name**. Names must start with a letter or number and may only contain letters, numbers, hyphens, or underscores (spaces are not permitted). Campaign names must be unique to all past and future campaigns.
6. Use the **Source Phone dropdown** to select the outbound phone number for the campaign.

!!! info ""
    **Note:** You can only select a phone number that supports SMS.


6. Use the **Language dropdown** to select one or more languages. English is selected by default, but you can also add Spanish. When multiple languages are selected, question content can be entered per language.
7. Enter text of your notification in the text box. There’s a 500-character limit.
8. Click **+ Add New Message** to add additional sequential message segments.
9. Click **Add Wait** to insert a wait/delay block between messages. Configure the wait duration by entering a number and selecting a time unit: minutes, hours, or days.
10. Click **Schedule** to proceed.

***

### Schedule Campaign

1. Choose when your Campaign starts.

* **Start Immediately** — The campaign begins 5 minutes after it’s launched.  During those 5 minutes, the campaign status in the dashboard view shows as Initialized. After 5 minutes, the campaign will change to Active.
* **Schedule Campaign** — Allows you to define a future start. Both a Campaign Start Date/Time and a Campaign Expiration Date/Time are shown.

2. Choose a **Campaign Expiration Date and Time**. This sets the date and time when the campaign will automatically stop. Click the calendar icon to pick a date and the time field to enter a time.
3. If you are scheduling a campaign, choose a **Campaign Start Date and Time**. This sets the date and time the campaign should begin.
4. Click **+ Add Quiet Hours** to define time windows that no calls will be placed. Multiple time ranges can be added.
5. Use the **Retry Failed Calls dropdown** to select how many times to retry calls that fail.
6. Review the **Campaign Duration Guidelines**. This reference panel reminds you of campaign durations: Emergency alerts up to 24 hours, service notifications up to 7 days, surveys up to 30 days, and general communications up to 14 days.
7. Click **Contact List** to proceed.

***

### Upload Contact List

Your contact list must adhere to the following file guidelines:

* The file must be a CSV file. Other file types aren’t supported.
* Your CSV file must include three columns: first\_name, last\_name, and phone\_number. All values in these columns must be provided for every row.
* Phone numbers must contain at least 11 digits with no spaces, dashes, or parentheses (e.g., +15551234567). A leading + is optional and CxPortal adds it automatically.
* You may optionally add a language column. Valid values are en-US, es-US, or leave the cell empty. This column is used to specify the preferred language for each contact.

**Note:** If no language is specified, the default language is used. You can view the default language in the language dropdown when adding messages.

* Make sure the column headers match these names exactly so the file can be processed correctly.

**Example:**

* first\_name,last\_name,phone\_number,language
* John,Doe,+15551234567,en-US
* Jane,Smith,15559876543,es-US
* Bob,Johnson,+15551112222,

**Note:** If a row's phone number is still invalid after this check, the upload is rejected. Use digit only with the optional leading "+" and at least 11 digits total (no spaces, dashes, or other characters).

To upload a contact list:

1. Drag and drop a CSV file into the content box or click the box to browse files on your computer.
2. A popup box appears with a success message once the file is processed.
3. Click **Review** to proceed.

***

### Review and Launch Campaign

1. Review your campaign details. This includes messages, schedule, and contacts.
2. To edit any of the campaign information or details, click the **edit button** on the right side of each section.
3. Once you have confirmed all details, click **Launch**.
