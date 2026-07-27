# SMS Survey Campaigns

## Before You Begin

An SMS Survey Campaign gathers insights with interactive text surveys of up to 5 questions. Responses are sent back via SMS.

Before creating an SMS Survey campaign, make sure you have the following in place:

* **The right permissions** — Campaigns use role-based access, so you'll need the specific role your organization assigns in order to create one.
* **A Campaign Group** — Every campaign must belong to a group. If you don't already have one, create a Campaign Group first.
* **An SMS-capable phone number** — You'll select a source phone number for the campaign, and it must be a number that supports SMS. Note that the same number can't be used for more than one SMS survey at a time.
* **Your survey questions** — Have your questions ready, along with the response type you want for each (Yes/No, Rating Scale, or Open response).
* **A contact list** — Prepare a CSV file with your recipients' details, formatted to meet the upload requirements.

***

## Limits and Constraints

Keep the following limits in mind when building an SMS Survey campaign:

* **Up to 5 questions** — A single SMS survey can include a maximum of five questions.
* **Response types** — Recipients reply by text, with response types limited to Yes/No, Rating Scale (1–5), or Open response.
* **SMS-capable source number** — You can only choose a phone number that supports SMS, and you can't use the same number for multiple SMS surveys.
* **Campaign name rules** — Names must start with a letter or number, may contain only letters, numbers, hyphens, or underscores (no spaces), and must be unique across all past and future campaigns.
* **Language options** — English is selected by default, with Spanish available as an additional language.
* **Contact list format** — The file must be a CSV containing first\_name, last\_name, and phone\_number columns (all values required), with phone numbers starting with + and containing at least 11 digits. An optional language column accepts en-US, es-US, or an empty value.
* **Survey duration** — Per the campaign duration guidelines, surveys can run for up to 30 days.
* **Post-campaign retention** — After a campaign ends, it stays on the dashboard for two months before its associated resources are removed from Amazon Connect; campaign metrics are retained.

***

## Step-by-Step Instructions

### Create an SMS Survey Campaign

1. In the left menu, click **Campaigns**, and then **Create Campaign**.
2. Select a **Campaign Group**. A group must be selected before you can proceed. Campaigns can’t be created without a group.
3. Click **SMS Survey**, and then **Content**.
4. Enter a **Campaign name**. Names must start with a letter or number and may only contain letters, numbers, hyphens, or underscores (spaces are not permitted). Campaign names must be unique to all past and future campaigns.
5. Use the **Source Phone dropdown** to select the outbound phone number for the campaign.

!!! info ""
    **Note:** You can only select a phone number that supports SMS and you can’t use the same phone number for multiple SMS surveys.


6. Use the **Language dropdown** to select one or more languages. English is selected by default, but you can also add Spanish. When multiple languages are selected, question content can be entered per language.
7. Enter text of your survey question in the question box.
8. Choose a **Response Type**. Select how the recipient should respond using the dropdown:

* **Yes/No**: Press 1 for Yes, 2 for No
* **Rating Scale**: (Press 1 to 5) Automatically generates response instructions: 1=Very Poor, 2=Poor, 3=Fair, 4=Good, 5=Excellent.
* **Open response**: Allows the recipient to speak a free-form answer.

9. Click **+ Add New Questio**n to add additional questions (up to 5 total).
10. Click Schedule to proceed.

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
* Phone numbers must start with + and contain at least 11 digits (e.g., +15551234567).
* You may optionally add a language column. Valid values are en-US, es-US, or leave the cell empty. This column is used to specify the preferred language for each contact.

!!! info ""
    **Note:** If no language is specified, the default language is used. You can view the default language in the language dropdown when adding messages.


* Make sure the column headers match these names exactly so the file can be processed correctly.

**Example:**

* first\_name,last\_name,phone\_number,language
* John,Doe,+15551234567,en-US
* Jane,Smith,+15559876543,es-US
* Bob,Johnson,+15551112222,

To upload a contact list:

1. Drag and drop a CSV file into the content box or click the box to browse files on your computer.
2. A popup box appears with a success message once the file is processed.
3. Click **Review** to proceed.

***

### Review and Launch Campaign

1. Review your campaign details. This includes messages, schedule, and contacts.
2. To edit any of the campaign information or details, click the **edit button** on the right side of each section.
3. Once you have confirmed all details, click **Launch Campaign**.
