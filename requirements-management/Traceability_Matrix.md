# Requirements traceability matrix

BRD v1.0 — simulated requirements. Jira status is a snapshot of the practice board, not a production delivery status.

| Objective | Epic | Requirement | Story | Verification approach (proposed) |
|---|---|---|---|---|
| Proactive SLA monitoring | KAN-4 | FR-01 / BR-02 | KAN-7 | Eligible unresolved ticket at 48h; exclusions; deduplication and alert payload |
| Timely escalation | KAN-4 | FR-02 / BR-03 | KAN-8 | Eligible ticket at 60h; lead notification; history entry |
| Clear accountability | KAN-5 | FR-03 / BR-06 | KAN-9 | Assignment, missing-owner flag and audit trail |
| Reliable handoffs | KAN-5 | FR-04 / BR-05 | KAN-10 | Required handoff fields, acknowledgment and unchanged SLA timer |
| Operational visibility | KAN-6 | FR-05 / BR-07 | KAN-11 | KPI and filtering comparison against SQL |
| Aging visibility | KAN-6 | FR-06 | KAN-12 | Cutoff, eligibility, age boundaries and required fields |

All verification approaches are planning items; UAT execution and results are not yet available.

The original Confluence page contains Smart Links for FR-01 through FR-06, with the linked Jira work-item statuses. The exported BRD retains these relationships.
