# Flow Analyzer Best Practices

### Recommended Configurations

#### Use Searchable Attributes for Phone Numbers

By default, Amazon Connect does not support searching by phone number. To make investigations faster and more reliable:

* Set a contact attribute (such as `customerNumber`) to the caller's phone number in your contact flows.
* Mark `customerNumber` as a searchable attribute in Connect.
* Use this attribute in Flow Analyzer's Contact **Attributes** filter to pull up interactions by phone number.

***

#### Use Clear, Consistent Naming for Flows & Attributes

Well-structured flows make troubleshooting easier and faster:

* Give flows and blocks meaningful, descriptive names.
* Set clear block identifiers in your Amazon Connect flows. These identifiers appear in Flow Analyzer logs and make it easier to pinpoint the exact block that needs attention.
* Use consistent naming conventions for custom attributes (e.g., `surveyId`, `contactIntent`, `locationName`).
* Log important decision points as attributes, so they appear in Details and Logs.

***

### Recommended Investigation Workflow

#### Start With Flow Analyzer Before Checking AWS Consoles

Begin investigations in Flow Analyzer before opening AWS tools. In many cases:

* The flow path shows the issue immediately.
* The **Problems** tab flags slow blocks and Lambda failures.
* Flow Logs and Interaction Logs reveal most of the required context.

!!! info ""
    **Info:** Only move to CloudWatch or other AWS tools when deeper debugging is needed.


***
