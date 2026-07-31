# Amazon Connect Global Resiliency (ACGR)

## Overview

**Amazon Connect Global Resiliency (ACGR)** lets you operate your contact center across multiple AWS Regions. If one Region becomes unavailable, you can redirect traffic and agents to another Region to maintain continuity. CxPortal gives you a single interface for managing this setup — without AWS CLI commands or multiple consoles during an incident.

[Watch video](https://www.youtube.com/watch?index=3&list=PLpgcSwyApvJBEYmlf0pjnS2XvFjvR8X1Y&v=LqaWkgNg01E)

!!! success ""
    ACGR removes the need to use AWS CLI commands or multiple consoles during an incident.


***

## Who Uses This

**Operations Teams** — Monitor regional health, manage traffic distribution, and trigger failovers during an incident.

**Business Admins** — Configure Traffic Distribution Groups and failover Playbooks, and assign agents and phone numbers.

***

## Key Concepts

| Term                                 | Definition                                                                                                   |
| ------------------------------------ | ------------------------------------------------------------------------------------------------------------ |
| **Primary Region**                   | The Region that normally handles your production traffic.                                                    |
| **Secondary Region**                 | A backup Region that can receive traffic during failover.                                                    |
| **Traffic Distribution Group (TDG)** | A group of agents and phone numbers that share the same traffic distribution between Regions.                |
| **Failover**                         | Redirecting traffic between Regions by updating distribution percentages. Agent assignments remain the same. |
| **Playbook**                         | A saved failover scenario that defines how traffic should shift between Regions.                             |

***

## Prerequisites/Permissions

Before you begin:

* ACGR must be enabled for your instance. Your contact center is operated across two AWS Regions — a **primary Region** and a **secondary Region** (for example, **us-west-2** as primary and **us-east-1** as secondary).
* You have an ACGR role assigned to your account: **ACGR Admin** (full read/write, can trigger failovers), **ACGR Editor** (initiates failovers via change request), or **ACGR Reader** (view-only).
* Resources follow a dependency chain: a **Traffic Distribution Group** must exist before you can create a **Playbook**, and at least one **Playbook** must exist before the Dashboard's **Failover Now** action becomes available.

***

## What You Can Do

What you can do in this module:

* Monitor primary and secondary Region health and resource distribution → [**Triggering a Failover**](amazon-connect-global-resiliency-acgr/triggering-a-failover.md)
* Trigger a failover when a Region needs to fail over →[ **Triggering a Failover**](amazon-connect-global-resiliency-acgr/triggering-a-failover.md)
* Create, edit, and delete failover scenarios → [**Managing Playbooks**](amazon-connect-global-resiliency-acgr/managing-playbooks.md)
* Create Traffic Distribution Groups and assign agents and phone numbers → [**Managing Traffic Distribution Groups**](amazon-connect-global-resiliency-acgr/managing-traffic-distribution-groups-tdgs.md)
* Adjust how agents and phone numbers are distributed between Regions → [**Managing Traffic Distribution Groups**](amazon-connect-global-resiliency-acgr/managing-traffic-distribution-groups-tdgs.md)

***

## Benefits at a Glance

* **Continuous Service** — Maintain service during regional outages.
* **Faster Recovery** — Reduce recovery time.
* **Rapid Failover** — Execute failover in minutes.
* **Standardized Response** — Use consistent, repeatable recovery procedures.
* **Centralized Management** — Manage multi-Region operations from one place.

<img width="2000" height="1414" alt="10" src="https://github.com/user-attachments/assets/bfc41fdd-7302-4c90-8641-8d3668e3dc54" />

!!! info ""
    **Note** ACGR centralizes failover controls and reduces the steps required to restore traffic during a service disruption.

***

## Common Use Cases

The following scenarios highlight when ACGR is commonly used.

<details>

<summary><strong>Regional Outage</strong></summary>

Redirect traffic to a secondary Region to maintain service when the primary Region becomes unavailable.

</details>

<details>

<summary><strong>Planned Testing</strong></summary>

Run controlled failovers during off-hours to validate readiness and confirm traffic moves as expected.

</details>

<details>

<summary><strong>Traffic Rebalancing</strong></summary>

Adjust how agents and phone numbers are distributed between Regions to support staffing or operational changes.

</details>

<details>

<summary><strong>Disaster Recovery Readiness</strong></summary>

Monitor assignments and playbooks regularly to ensure resources are prepared before an incident occurs.

</details>

***
