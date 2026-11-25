# Jira backlog — user stories and acceptance criteria

**Baseline:** BRD v1.0. This reading copy records the six guided-practice stories and their proposed criteria. The work-item IDs were created in Jira; this is not a claim of implementation or successful UAT.

## KAN-4 — SLA Monitoring & Escalation

### KAN-7 · FR-01 · 48-Hour SLA Warning (High)

As a support agent, I want to receive an alert when an unresolved ticket reaches 48 hours, so that I can take action before the assumed 72-hour resolution SLA is breached.

**Acceptance criteria**
- Given an unresolved Technical ticket with Normal or Low priority, when its elapsed time reaches 48 hours, then an alert is sent to the assigned agent.
- Resolved tickets must not trigger alerts.
- Each ticket receives only one 48-hour warning.
- Alert includes ticket ID, priority, owner and elapsed time.

**Subtasks:** KAN-13 Define SLA Warning Business Rules → KAN-14 Configure 48-Hour Alert Logic → KAN-15 Validate SLA Warning Scenarios. Dependencies were set during the guided exercise.

### KAN-8 · FR-02 · 60-Hour Ticket Escalation (High)

As a support team lead, I want unresolved tickets to be escalated when they reach 60 hours, so that I can prioritize resources and prevent SLA breaches.

**Acceptance criteria**
- Eligible unresolved Technical Normal/Low tickets reaching 60 elapsed hours trigger notification to the team lead.
- Resolved tickets do not trigger escalation.
- Escalation occurs only once at the threshold.
- Notification includes ticket ID, priority, current owner and elapsed time.
- Escalation is recorded in ticket history.

## KAN-5 — Ticket Ownership & Routing

### KAN-9 · FR-03 · Ticket Ownership Assignment (High)

As a support team lead, I want every active ticket to have a designated owner, so that accountability is clear.

**Acceptance criteria**
- Every active ticket must have an assigned owner.
- Unassigned tickets are flagged for review.
- Ownership changes are recorded in ticket history.

### KAN-10 · FR-04 · Ticket Handoff Management (High)

As a support agent, I want a structured ticket handoff process, so that important information is not lost during transfers.

**Acceptance criteria**
- Each handoff includes a reason, current status and next action.
- Receiving agent acknowledges the handoff.
- Handoff timestamp and previous owner are recorded.

**Business rules:** Ticket transfers do not reset the SLA timer. Current owner remains accountable until acceptance.

## KAN-6 — Performance Reporting

### KAN-11 · FR-05 · SLA Performance Dashboard (Medium)

As an operations manager, I want to monitor SLA performance by queue and priority, so that I can identify performance gaps.

**Acceptance criteria**
- Display total tickets, open backlog, SLA compliance, breaches and average resolution time.
- Support queue and priority filters.
- KPI calculations match independently validated SQL for the same data and filters.

**Business rule:** Resolution SLA compliance uses resolved tickets and the assumed 72-hour threshold. This story describes proposed requirements; the existing analytical Power BI report is not proof that every criterion is implemented.

### KAN-12 · FR-06 · Weekly Backlog Reporting (Medium)

As a support team lead, I want a weekly backlog report, so that I can prioritize unresolved tickets and allocate resources.

**Acceptance criteria**
- Display unresolved tickets by queue and priority.
- Group aging: under 48h, 48h to under 60h, 60h to 72h, over 72h.
- Include current owner and reporting timestamp.

**Business rule:** Use a consistent weekly reporting cutoff; exclude resolved tickets.

## Open questions before implementation

Confirm owner and lead identity, notification channels, exact timing and processing tolerance, existing-ticket migration, reopen behavior, handling of missing ownership/history, pilot applicability to each story, access roles, reporting cutoff and timezone. The static dataset does not include the event history and ownership fields required to implement all proposed stories.
