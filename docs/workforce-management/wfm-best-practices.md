# Workforce Management Best Practices

## Recommended Configurations

**Set honest freshness expectations.** Metrics labeled with an "as of" timestamp are 15-minute aggregates. Do not treat these as instantaneous. Agent status and agent counts are genuinely real-time (sub-15 seconds).

## Common Pitfalls

{% hint style="warning" %}
"Live" does not always mean sub-second. Adherence-family metrics (Adherence %, Adherent Time, Non-Adherent Time, Scheduled Time) are 15-minute aggregates from GetMetricDataV2. Only agent status changes and agent/queue counts are sub-15-second. If a KPI tile shows "Live," check whether it also shows an "as of" timestamp.
{% endhint %}

**Avoid relying solely on adherence scores for real-time staffing decisions.** Adherence verdicts can lag 5–15 minutes. For immediate staffing awareness, use Agent Status (genuinely real-time) in combination with the Team Scorecard.

## Performance and Scaling

Workforce Management is architected for enterprise-scale contact centers:

- **Read efficiency** — Many supervisors polling simultaneously share one cached database read per refresh interval. No over-fetching — queries fetch only the fields being displayed.
- **Write safety** — All event writes are idempotent and guarded by event time. A delayed or duplicate event can never overwrite newer data.
- **Failure isolation** — Every failure path lands in an alarmed quarantine queue. One busy customer cannot starve others due to a hard concurrency cap on the SQS consumer.
- **Security** — CxPortal holds no standing customer credentials. Roles are assumed per-call into the customer's AWS account. Deploys are additive and reversible.

## Security and Compliance

- **Zero standing credentials.** All cross-account access uses per-call role assumption. No long-lived keys or tokens are stored in CxPortal.
- **Observability.** CloudWatch dashboards and alarms are deployed across both the CxPortal and customer AWS accounts. Failed events land in an alarmed Dead-Letter Queue (DLQ) in AWS SQS for investigation.
