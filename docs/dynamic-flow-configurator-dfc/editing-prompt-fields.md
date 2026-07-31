---
description: >-
  Edit SSML voice content in a Prompt field using the rich editor, the SSML
  formatting toolbar, and the Code View.
---

# Editing Prompt Fields

## Overview

A **Prompt** field stores the SSML (Speech Synthesis Markup Language) content Amazon Connect speaks to callers. Instead of hand-writing SSML tags, you edit prompt content with a rich text editor and a formatting toolbar that inserts pauses, emphasis, pronunciation, and speaking-rate controls for you. A **Code View** is also available for editing the raw SSML directly.

***

## Before You Begin

* The entity's schema must include a **Prompt** field. See [Setting Up Entities and Schemas](setting-up-entities-and-schemas.md).
* You need item edit permission on the entity to change prompt content.
* Root `<speak>` tags are applied automatically — you don't need to add them yourself.

***

## Step-by-Step Instructions

### Switching Between Rich Editor and Code View

1. Open the item containing the Prompt field.
2. Click **Switch to Code View** to edit the raw SSML directly, or **Switch to Code View** / **Switch to Rich Editor View** to toggle back. The button's label always reflects the view you'll switch *to*.

{% hint style="info" %}
**Note:** In Rich Editor view, a helper note — "Root \<speak> tag applied automatically" — reminds you that the root tag is handled for you.
{% endhint %}

***

### Applying SSML Formatting (Rich Editor)

1. Select the text you want to format (or place your cursor where you want to insert a pause).
2. In the **SSML Formatting** toolbar, click a format:

| Format | What it controls |
| --- | --- |
| **Pause** | Inserts a timed pause: 500ms, 1000ms, or 2000ms |
| **Rate** | Speaking rate: Slow, Medium, Fast |
| **Volume** | Volume: Soft, Medium, Loud |
| **Pitch** | Pitch: Low, Medium, High |
| **Say as** | How a value is read aloud: Digits, Spell Out, Date |
| **Language** | Reads the selection in another language: Spanish, French, German |
| **Structure** | Groups the selection as a Paragraph or Sentence |

3. Less commonly used formats are grouped under **Less Frequently used**: **Word Role** (Verb, Past Tense, Noun), **Phoneme** (custom pronunciation), and **Substitute** (read a substitute value instead of the visible text).
4. If you click a format without selecting any text, a message prompts: "Select some text to apply this formatting."

{% hint style="info" %}
**Note:** A footer hint under the toolbar reads: "Insert or highlight text to apply an above formatting style." Click the collapse icon to hide the toolbar and reclaim space.
{% endhint %}

***

### Editing or Removing an Applied Format

1. Click any formatted (highlighted) text in the editor.
2. If exactly one format applies, a popover shows the format's name and its available values, with a checkmark on the current value. Click **Remove** to remove that format.
3. If multiple formats overlap on the same text, the popover header reads "**N** Formats Applied," listing each one with its own value and a **Remove** control.
4. For **Phoneme** and **Substitute**, enter the value directly in the popover — there's no separate Apply button; the change applies as you type.

***

### Checking Validation Before You Play

The editor shows one of three validation states above the playback controls:

| State | Message |
| --- | --- |
| Empty | "No SSML to play yet" |
| Valid | "SSML validated, ready to play" |
| Invalid | "SSML invalid, review and correct to play" |

Play is only available when the state is valid.

***

### Previewing Prompt Audio

1. Click **Play as**, then choose a language from the adjacent dropdown — **Default**, or any language you've paired with a voice in Local Speech Setting.
2. Click **Play as** again to play; click it while playing to stop.
3. If Amazon Polly rejects the synthesized speech (for example, an unsupported combination for a given voice), the message updates to "Couldn't play - " followed by the specific reason, and a toast notification also reports the error.

{% hint style="info" %}
**Note:** Playback here previews how the text sounds in your browser only — it doesn't affect what callers hear in Amazon Connect. To set up which voice plays for each language, see [Previewing Voice and Language with Local Speech Setting](https://docs.caylent.com/cxportal/dynamic-flow-configurator-dfc/getting-started-with-dfc/#previewing-voice-and-language-with-local-speech-setting).
{% endhint %}

***

### Working with Imported or Unrecognized SSML Tags

If a prompt contains an SSML tag the rich editor doesn't have a dedicated control for, it's preserved rather than removed:

* If the tag wraps plain text, it appears with a dotted underline. Clicking it shows a **Read-only** popover with the raw markup and the note: "Switch to Code View to edit this tag."
* If the tag is self-closing or contains further markup, it renders as a non-editable chip showing the tag name.

To change one of these tags, switch to **Code View** and edit the SSML directly.

***

## Troubleshooting

| Problem | Cause | Solution |
| --- | --- | --- |
| **Play button is disabled** | The prompt's SSML is empty or invalid | Check the validation message above the playback controls and correct the content. |
| **A tag can't be edited from the toolbar** | The tag isn't one of the rich editor's supported formats | Switch to **Code View** to edit it directly. |
| **Play fails with an error message** | Amazon Polly rejected the synthesized speech (for example, an unsupported setting for the selected voice) | Review the specific error shown, adjust the prompt content, and try again. |

***

**Need help?** Click **Support** in the top navigation of CxPortal to submit a request.

***
