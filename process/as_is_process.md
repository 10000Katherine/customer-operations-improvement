# AS-IS process map (conceptual, not observed)

This is a **working hypothesis**. The synthetic ticket dataset does not contain handoff logs, queue ownership or workflow events sufficient to validate an actual current-state process.

```mermaid
flowchart TD
 A[Customer submits support request] --> B[Ticket enters support queue]
 B --> C[Priority assigned]
 C --> D[Agent investigates]
 D --> E{Can resolve within available resources?}
 E -- Yes --> F[Resolve and close ticket]
 E -- No --> G[Escalate to specialist / wait for handoff]
 G --> D
 F --> H[Capture outcome / CSAT if provided]
```

**Validation needs:** interviews with queue leads, event timestamps, handoff count, assignment latency, reopened ticket history, actual SLAs by priority and ticket type.
