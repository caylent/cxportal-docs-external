# ACGR Best Practices

## Recommended Configurations

### Traffic Distribution

* **Use active-standby as your default model.** Run 100% of traffic in the primary Region with the secondary Region as a warm standby. This is the lowest-complexity approach and meets core DR objectives without ongoing operational overhead. The secondary Region only receives traffic when you deliberately shift it, during a failover or a planned DR test.
* **Adjust distributions in small increments.** Whether you are testing, failing over, or recovering, avoid moving traffic in large jumps. Increments of 10–20% give you time to observe queue depth and agent availability at each stage before proceeding. This applies to both failover and failback.

***

### Playbooks

* **Configure Playbooks before you need them.** Build, review, and test Playbooks during stable operating conditions, not during an incident. Pre-configured Playbooks are what let a failover take minutes instead of hours.
* **Use descriptive names that are unambiguous under pressure.** The person executing a failover may not be the person who created the Playbook. Names should communicate scope and intent at a glance — for example, "Full Failover to East — All Queues", "50/50 Split Test — Off Hours", "Partial Failover — Support Only".
* **Write a description for every Playbook.** Include the conditions under which the Playbook should be used. This reduces decision-making during time-sensitive events.
* **Test Playbooks periodically.** Run controlled failovers during planned maintenance windows or off-hours. Regular testing confirms that traffic shifts as expected, agents can handle contacts in the secondary Region, and ancillary services behave correctly after a shift.

***

### Agents

* **Keep agents signed in to both Regions.** For agent distribution to function when traffic shifts, agents must be active in both the primary and secondary Regions before the failover occurs. Agents signed in to only one Region are not available in the other after a shift. This is a prerequisite, not a step to take during an incident.
* **Assign all agents to a TDG before go-live.** Unassigned agents are not subject to distribution rules and do not follow traffic during a failover. Use the **Agent Summary** card on the Dashboard to monitor unassigned counts and resolve them before an incident.

***

### Phone Numbers

* **Assign all phone numbers to a TDG.** Unassigned phone numbers do not follow distribution rules during a failover. All inbound numbers must belong to a TDG to be covered by your resiliency strategy.
* **Manually assign numbers created before ACGR was enabled.** Numbers created after ACGR is enabled are automatically assigned to the **Default TDG**; numbers that existed before may be unassigned. Verify this during initial setup.

***

### Setup and Configuration

* **Scope ancillary services before enabling ACGR.** ACGR replicates the core Amazon Connect instance — queues, routing profiles, contact flows, hours of operation, and agent records. It does **not** replicate ancillary services such as Lambda functions, DynamoDB tables, Lex bots, knowledge bases, or ETL pipelines. Any of these that exist only in the primary Region become a point of failure when traffic shifts. Identify and plan for these dependencies before go-live.
* **Verify the replica is passive after onboarding.** When ACGR is first enabled, the secondary instance is completely passive until traffic is deliberately shifted. Confirm this before proceeding with any production configuration.
* **Confirm TDG names before saving.** TDG names and descriptions cannot be changed after creation. Verify all details are correct before clicking **Create**.

***

## Common Pitfalls

<details>

<summary><strong>Avoid:</strong> Adopting active-active (a 50/50 split across two Regions) without preparing for the overhead. </summary>

**Why:** A 50/50 split is supported but introduces real complexity in reporting, analytics, and workforce management. Reconciling contact data across two Regions requires additional tooling and process investment. Do not adopt this model without a clear plan for sustaining it day to day.

</details>

<details>

<summary><strong>Avoid:</strong> Pulling agents back to the primary Region too early during failback.</summary>

**Why:** Moving telephony first lets in-flight contacts in the secondary Region complete naturally and queues drain before agents are moved back. Pulling agents back too early abandons active interactions.

</details>

<details>

<summary><strong>Avoid:</strong> Re-executing a Playbook because the Dashboard has not updated yet. </summary>

**Why:** Changes are applied asynchronously after execution. The Dashboard may take a short time to reflect updated distributions and the new failover timestamp.

</details>

<details>

<summary><strong>Avoid:</strong> Leaving agents or phone numbers unassigned. </summary>

**Why:** Unassigned resources are not subject to distribution rules and do not follow traffic during a failover, leaving inbound traffic uncovered.

</details>

***

Performance and Scaling

### Daily Operations

Use the **Dashboard** as your starting point every day. Use it to confirm regional health, verify that resources are correctly assigned, and review recent activity before issues occur.

| Check                   | What to look for                                |
| ----------------------- | ----------------------------------------------- |
| Agent card              | Unassigned count is low or zero                 |
| Phone Number card       | Unassigned count is low or zero                 |
| Regional Activity       | Secondary Region shows expected activity levels |
| Traffic Trends          | No unexpected spikes or drops                   |
| Recently Used Playbooks | No unexpected executions                        |

* **Investigate unexpected traffic-trend spikes.** Peaks in the **Secondary Region** chart often correlate with failover events or tests. Cross-reference with the **Recently Used Playbooks** panel and the **Last Failover** timestamp to confirm whether the spike was intentional.
* **Filter TDGs by name or ID when managing large configurations.** The **Traffic Distributions** page supports filtering by TDG name and UUID — use these filters to locate and verify specific groups quickly.

***

### Failover Execution&#xD;

* **Start from the Dashboard.** It provides a real-time view of regional health, assignment status, and recent Playbook activity. Begin every failover response here; do not assess regional health from another location first.
* **Review the Playbook scope before confirming.** The **Failover Now** dialog shows the distribution percentages that will be applied. Confirm the correct Playbook is selected and that the team is prepared. The action affects live call traffic immediately.
* **Allow time for the Dashboard to update.** Changes are applied asynchronously; do not re-execute a Playbook because the Dashboard has not updated yet.
* **Monitor the secondary Region after execution.** Watch the **Regional Activity** metrics to confirm calls are routing correctly and agents are available, and cross-reference with the **Traffic Trends** charts.

***

### Failback and Recovery&#xD;

* **Shift telephony before agents.** When returning traffic to the primary Region, move telephony first. This lets in-flight contacts in the secondary Region complete and queues drain before agents are moved back.
* **Return traffic incrementally.** Use the TDG distribution sliders to move traffic back in stages — a common sequence:
  1. 20% to primary — verify queues are healthy
  2. 50% to primary — monitor agent availability
  3. 80% to primary — confirm stability
  4. 100% to primary — full restoration
* **Review and refine Playbooks after recovery.** Once service is fully restored, review the execution timeline and the actions taken. If observed behavior suggests a Playbook should be adjusted, update it while the details are fresh.

***

## Security and Compliance

**Ensure SSO is enabled for incident-response access.** SSO via Entra (Azure AD) is required to access CxPortal during a regional outage; username-and-password sign-in is unavailable when the primary Region is down. Because the ACGR module remains available during a regional outage, confirm your operations team can sign in via SSO before an incident. See [Setting up SSO/Authentication. ](setting-up-sso-authentication.md)

***
