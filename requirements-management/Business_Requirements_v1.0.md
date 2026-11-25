# Business Requirements Document — Customer Support Operations Improvement

**Version:** 1.0 | **Status:** Draft — Pending Validation  
**Project type:** Simulated Business Analysis Project  
**Baseline date:** 2026-11-24

This Markdown reading copy follows the original Confluence BRD v1.0. Jira IDs refer to the personal practice workspace; the workspace itself may require permission. No stakeholder approval, production deployment or achieved SLA improvement is claimed.

## 1. Business background

Analysis of 4,000 synthetic customer support tickets identified differences across support queues:

- Resolution SLA compliance: 78.17%; SLA breaches: 824.
- Open backlog: 225 tickets; average resolution time: 58.92 hours.
- Technical and Integrations accounted for 65.3% of SLA breaches.

The findings identify areas for investigation, not confirmed root causes.

## 2. Business objectives

- Target 85% overall resolution SLA compliance within 12 weeks.
- Improve ticket ownership and escalation visibility.
- Reduce avoidable resolution delays.
- Maintain high-priority ticket performance.

## 3. Stakeholders

All roles are simulated.

| Role | Responsibility |
|---|---|
| Operations Manager | Business objectives and performance monitoring |
| Business Analyst | Requirements analysis and documentation |
| Support Team Lead | Ticket prioritization and escalation |
| Support Agent | Ticket investigation and resolution |
| Developer | Solution configuration |
| QA Analyst | Requirements validation and testing |

## 4. Project scope

**In scope:** SLA warnings and escalation, ownership and handoffs, operational dashboards and backlog reporting, requirements validation and monitoring.

**Out of scope:** Full CRM replacement, changes to the assumed 72-hour SLA, organization-wide deployment and staffing restructuring.

The initial pilot focuses on Technical tickets with Normal and Low priority.

## 5. Functional requirements

| ID | Requirement | Priority | Jira Story |
|---|---|---|---|
| FR-01 | Send a warning when eligible unresolved tickets reach 48 hours. | High | KAN-7 |
| FR-02 | Escalate eligible unresolved tickets at 60 hours. | High | KAN-8 |
| FR-03 | Assign one accountable owner to each active ticket. | High | KAN-9 |
| FR-04 | Record and manage structured ticket handoffs. | High | KAN-10 |
| FR-05 | Provide an SLA performance dashboard. | Medium | KAN-11 |
| FR-06 | Generate weekly backlog reports. | Medium | KAN-12 |

See [user stories and acceptance criteria](User_Stories.md).

## 6. Non-functional requirements

| ID | Category | Proposed requirement |
|---|---|---|
| NFR-01 | Data Accuracy | Dashboard KPI counts must match validated SQL results. |
| NFR-02 | Usability | Reports must support queue and priority filtering. |
| NFR-03 | Auditability | Ownership changes, handoffs and escalation events must be recorded. |
| NFR-04 | Access Control | Ticket information must be accessible only to authorized users. |

These proposed requirements need further measurable thresholds, role definitions and validation before release.

## 7. Business rules

- BR-01: The assumed resolution SLA is 72 elapsed hours.
- BR-02: Eligible unresolved tickets receive a warning at 48 hours.
- BR-03: Eligible unresolved tickets are escalated at 60 hours.
- BR-04: Resolved tickets must not trigger warnings or escalations.
- BR-05: Ticket transfers must not reset the SLA timer.
- BR-06: Each active ticket must have one accountable owner.
- BR-07: Resolution SLA compliance is calculated using resolved tickets.

## 8. Requirements traceability

| Objective | Jira Epic | Requirements |
|---|---|---|
| Improve SLA monitoring | KAN-4 | FR-01, FR-02 |
| Improve ticket ownership | KAN-5 | FR-03, FR-04 |
| Improve operational visibility | KAN-6 | FR-05, FR-06 |

Each functional requirement was linked to its Jira Story using Confluence Smart Links. See [traceability matrix](Traceability_Matrix.md).

## 9. Assumptions and constraints

- Synthetic data, no real organization or customers represented.
- SLA thresholds and proposed workflows require stakeholder validation.
- Historical workflow events and handoff records are unavailable.
- Proposed improvements have not been implemented; the 85% target has not been achieved.

## 10. Change log

| Version | Date | Description | Status |
|---|---|---|---|
| 1.0 | 2026-11-24 | Initial business requirements baseline | Draft |

The proposed threshold changes are separate [change-control exercises](Change_Management.md), not approved revisions to this baseline.
