# ACGR Reference

Field Reference Table

### Playbook Fields

| Field Name                      | Type      | Required | Description                                                                       |
| -------------------------------- | --------- | -------- | ----------------------------------------------------------------------------------- |
| **Name**                        | Text      | Yes      | The Playbook name, shown as a clickable link that opens the Edit Playbook dialog. |
| **Description**                 | Text      | Yes\*    | A short summary of the Playbook's purpose.                                        |
| **Traffic Distribution Groups** | Selection | Yes      | One or more TDGs the Playbook controls.                                           |

***

### TDG — Create Fields&#xD;

| Field Name      | Type | Required | Description                                                 |
| --------------- | ---- | -------- | ------------------------------------------------------------- |
| **Name**        | Text | Yes      | Display name for the TDG. Cannot be changed after creation. |
| **Description** | Text | No       | Optional description. Cannot be changed after creation.     |

***

### TDG — Detail Header Fields&#xD;<br>

| Field Name           | Type      | Description                                                                                      |
| -------------------- | --------- | ---------------------------------------------------------------------------------------------------- |
| **Name**             | Read-only | The display name of the TDG.                                                                     |
| **ID**               | Read-only | The system-generated UUID of the TDG.                                                            |
| **Primary Region**   | Read-only | The AWS Region designated as the primary (for example, us-west-2).                               |
| **Secondary Region** | Read-only | The AWS Region designated as the secondary (for example, us-east-1).                             |
| **Agents**           | Read-only | Current agent distribution percentage (e.g., "100/0") and total agent count assigned.            |
| **Phone Numbers**    | Read-only | Current telephony distribution percentage (e.g., "100/0") and total phone number count assigned. |

***

### Distributions Panel

| Control                    | Type   | Description                                                                          |
| -------------------------- | ------ | ------------------------------------------------------------------------------------ |
| **Agent Distribution**     | Slider | Splits agent routing between the primary Region (left) and secondary Region (right). |
| **Telephony Distribution** | Slider | Splits incoming call traffic between the primary and secondary Regions.              |

***

### Dashboard Sections and Metrics

The ACGR Operations Dashboard provides an executive view of Global Resiliency.

| Section                              | What it shows                                                                                                                                                                             |
| ------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Agent Summary**                    | Total agents, number of agents not assigned to a TDG, and percentage unassigned.                                                                                                          |
| **Phone Number Summary**             | Total phone numbers, number of unassigned phone numbers, and percentage unassigned. Unassigned numbers do not follow distribution rules, so this confirms all inbound traffic is covered. |
| **Primary Region Summary**           | Total calls initiated, average call duration, and active agents for the primary Region.                                                                                                   |
| **Secondary Region Summary**         | Total calls initiated, average call duration, and active agents for the secondary Region.                                                                                                 |
| **TDG Agents & Number Distribution** | Donut charts showing agent distribution by TDG and phone number distribution by TDG.                                                                                                      |
| **Regional Activity**                | Current operational metrics (total calls, average call duration, active agents) for each Region, helping you confirm which Region is handling traffic.                                    |
| **Traffic Trends**                   | Per-Region line charts of total contacts over the last 30 days (includes calls that may not have been answered by an agent).                                                              |
| **Recently Used Playbooks**          | Recently executed Playbooks with timestamps; lets you review recent failover activity and rerun common Playbooks.                                                                         |
| **Failover to other region**         | The card containing the **Failover Now** action. When no Playbooks exist, it shows "Set up playbooks to enable this feature."                                                             |
| **Last Failover**                    | Information about the most recent failover event (see below). When none has occurred it shows "Never triggered."                                                                          |

***

### Last Failover Fields&#xD;

| Field            | Description                                                                    |
| ---------------- | ------------------------------------------------------------------------------ |
| **Time elapsed** | How long ago the last failover occurred (for example, "1 day ago").            |
| **Timestamp**    | The exact date and time of the last failover (for example, "May 16, 1:23 PM"). |

!!! info ""
    **Info:** Average contact duration measures the time from contact initiation (when the customer starts ringing) to disconnection, including time in queue and with an agent.


***

Limits and Constraints

* Agent Distribution percentages for the primary and secondary Regions must total **100** within each TDG. The same applies to Telephony Distribution.
* **All phone numbers must belong to a TDG.** Unassigned numbers do not follow distribution rules during a failover.
* TDG **Name** and **Description** cannot be changed after creation.
* Changes are applied **asynchronously**: a new TDG should appear in the list within a minute after creation, and a newly created TDG may take a few minutes before it appears in a Playbook's TDG selector. Failover and distribution changes may take a short time to reflect on the Dashboard.
* Phone numbers created **after** ACGR is enabled are automatically assigned to the **Default TDG**; numbers created before ACGR was enabled may be unassigned and require manual assignment.
* For agent distribution to function when traffic shifts, agents must be active in **both** the primary and secondary Regions before the failover occurs.

***
