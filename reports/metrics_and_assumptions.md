# Metric definitions and limitations

| Metric | Definition |
|---|---|
| Total tickets | Count of all tickets in the CSV |
| Resolved | Non-blank `resolved_at` |
| Open backlog | Blank `resolved_at` at the dataset extraction; not proof of SLA breach |
| Resolution hours | Elapsed hours from `opened_at` to `resolved_at`, resolved valid-duration tickets only |
| Resolution SLA | Assumed 72-hour threshold; resolved cases with duration <=72h are compliant |
| SLA breaches | Resolved cases with duration >72h |
| SLA compliance | Resolved cases within 72h / all valid resolved cases |
| Avg first response | Average `first_response_min` excluding missing |
| Monthly volume | Number of tickets grouped by `opened_at`; incomplete February 2024 excluded from **visual only** |

**Observed counts:** 4,000 total, 225 unresolved, 3,775 resolved, 824 resolved-case breaches, 78.17% compliance. The static export cannot reveal exact internal handoff times, staffing, root causes, backlog age, or realized improvements. Metrics are simulation findings, not real operating results.
