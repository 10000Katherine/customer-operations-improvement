# Requirements change management — practice exercises

**Status:** Impact-analysis exercises only. Neither request was approved or verified as applied to the live Jira/Confluence workspace. The BRD v1.0 baseline remains 48h warning / 60h escalation / 72h resolution SLA.

| ID | Proposed change | Disposition |
|---|---|---|
| CR-01 | Warning threshold 48h → 36h; escalation and resolution SLA unchanged | Pending stakeholder validation |
| CR-02 | Escalation threshold 60h → 54h; resolution SLA unchanged | Pending stakeholder validation |

## CR-01 — warning threshold

Direct impact: KAN-4 scope, KAN-7 title/story/criteria/rules, KAN-13 business-rule review, KAN-14 configuration, KAN-15 test design, BRD FR-01 and BR-02. Review KAN-12 aging bands, related process maps and alert reporting; verify KAN-8 still works with the revised warning.

## CR-02 — escalation threshold

Direct impact: KAN-4 scope, KAN-8 story/title/criteria/rules, BRD FR-02 and BR-03, and future escalation configuration and boundary tests. Review KAN-12 aging bands, TO-BE process, operational reports and integration with the warning threshold.

## Approval and traceability

1. Record requester, business rationale and proposed effective date.
2. Confirm pilot scope, elapsed-hour interpretation, existing tickets, exceptions and dependencies.
3. Obtain stakeholder approval before changing the baseline; avoid unrelated new features without separate approval.
4. Update affected Jira work items, acceptance criteria, process models, reporting definitions and test scenarios.
5. Create a new BRD version and record the change request, decision, date and approver. Preserve v1.0 as historical evidence.
6. Revalidate boundary conditions and traceability before closure.

The 36h and 54h proposals were considered separately in training. A combined configuration would require a separate confirmed decision. New popups, permissions, transfer-count reports or root-cause workflows are not implicitly authorized by a threshold change.
