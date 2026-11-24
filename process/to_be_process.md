# Proposed TO-BE process map (not implemented)

This is a **pilot design**, not an observed or tested improvement. Alert and escalation thresholds are candidate policies to validate.

```mermaid
flowchart TD
 A[Customer submits support request] --> B[Categorize and assign accountable owner]
 B --> C[Record priority and assumed 72h resolution target]
 C --> D[Investigate and resolve]
 D --> E{Resolved?}
 E -- Yes --> F[Close with reason, resolution and timestamps]
 E -- No --> G{Elapsed time >= 48h?}
 G -- No --> D
 G -- Yes --> H[Alert owner and queue lead]
 H --> I{Elapsed time >= 60h?}
 I -- No --> D
 I -- Yes --> J[Escalate to specialist / queue lead with clear handoff]
 J --> D
 F --> K[Weekly metrics review and root-cause sampling]
 K --> L[Adjust pilot rules and monitor guardrail KPIs]
```

**Pilot:** Technical Normal/Low first, while separately sampling Integrations tickets. **Guardrails:** monitor High/Urgent response, reopening, backlog, and queue mix so gains are not from relabeling or shifting work.
