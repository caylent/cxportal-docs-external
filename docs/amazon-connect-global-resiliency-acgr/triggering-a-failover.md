# Triggering a Failover

Trigger a failover from the ACGR Dashboard to redirect live call traffic between Regions according to a saved Playbook.

## Before You Begin

* You need the **ACGR Admin** role to trigger a failover directly.
* At least one **Playbook** must exist. The **Failover Now** action is unavailable until a Playbook is configured (see [Managing Playbooks](https://docs.caylent.com/cxportal/amazon-connect-global-resiliency-acgr/managing-playbooks/).
* Confirm the correct scenario is selected and that the team is prepared before proceeding.

***

### Step-by-Step Instructions

The **Dashboard** provides a daily operational view of your resiliency setup. Use it to monitor health and initiate failover when necessary.

To execute a failover:

1. In the left navigation, select **ACGR**, then click **Dashboard**.
2. Click **Failover Now**.
3. Select a **Playbook**.
4. Review the distribution percentages.
5. Confirm.

After execution, changes are applied asynchronously. It may take a short time for the Dashboard to reflect the updated distributions and failover timestamp.

!!! danger ""
    The **Failover Now** action redirects live call traffic according to the selected Playbook. Confirm the correct scenario is selected and that the team is prepared before proceeding.


!!! warning ""
    **Warning:** Do not re-execute a Playbook because the Dashboard has not updated yet. Changes are applied asynchronously and may take a short time to appear.


After a failover, watch the **Regional Activity** metrics to confirm that calls are routing correctly and that agents are available in the secondary Region. Cross-reference with the **Traffic Trends** charts to validate that the shift occurred as expected. For the full failover and failback workflow, see [ACGR Best Practices.](acgr-best-practices.md)

***

## Troubleshooting

| Problem                                                                                                                | Cause                                          | Solution                                                                                                                                                                                           |
| ---------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| **Failover Now** is unavailable / the "Failover to other region" card shows "Set up playbooks to enable this feature." | No Playbooks are configured for this instance. | Create at least one Playbook. See [Managing Playbooks](managing-playbooks.md). |
| The Dashboard has not updated after a failover.                                                                        | Changes are applied asynchronously.            | Wait a short time for the Dashboard to reflect the updated distributions and failover timestamp. Do not re-execute the Playbook.                                                                   |

***
