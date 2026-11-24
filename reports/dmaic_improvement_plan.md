# DMAIC Working Analysis — Customer Support Operations Improvement

**Purpose:** Working analysis and implementation design. This complements the concise Business Case and the two *illustrative* process diagrams.

## Define
- **Business problem:** Under a project-assumed 72-hour resolution SLA, the simulated operation records 824 breaches in 3,775 resolved tickets (78.17% compliance). Technical and Integrations account for 538 breaches (65.3%).
- **Goal:** Explore whether resolution SLA compliance can reach 85% within 12 weeks, subject to baseline and workflow validation; maintain backlog and High/Urgent performance guardrails.
- **Scope:** Pilot Technical Normal/Low; investigate Integrations concurrently; expand only with evidence. Exclude product development, staffing changes without evidence, and promises of realized savings.
- **Stakeholders to validate:** Support operations lead (sponsor), Technical/Integrations queue owners, frontline agents, product/engineering escalation contact and BI analyst.

## Measure
| Metric | Baseline | Definition / caution |
|---|---:|---|
| Ticket count | 4,000 | All sample rows |
| Resolved-ticket count | 3,775 | Resolution timestamp present (verify chronology) |
| Open backlog | 225 | Resolution timestamp missing at sample extract; not necessarily overdue |
| Resolution SLA compliance | 78.17% | Valid resolved tickets within assumed 72h / valid resolved tickets |
| SLA breaches | 824 | Resolved tickets with elapsed resolution time >72h |
| Avg. resolution time | 58.92h | Mean across valid resolved cases |
| Avg. first response time | 154.64 min | Missing ~4%; no response-time SLA was supplied |
| Technical / Integrations breaches | 367 / 171 | 44.5% / 20.8% of all breaches |
| Technical open tickets | 104 | 46.2% of all open cases |

**Denominator caution:** A single exported snapshot is not a full lifecycle cohort. When measuring future performance, use the same definitions, comparable calendar periods, and stratification by queue and priority. Exclude the incomplete final month from monthly trend *only*, not the dataset-wide baseline.

## Analyze

### Evidence from ticket aggregates
- Technical: 1,282 tickets; 367 SLA breaches; 83.02h mean resolution. Its Normal (177) and Low (158) priorities generate 335 of 367 breaches.
- Integrations: 525 tickets; 171 breaches; 95.53h mean resolution; lowest SLA compliance (64.30%).
- Distribution identifies **where to look**; it does not establish causal drivers.

### Hypothesis / validation matrix
| Hypothesis (not a proven cause) | Evidence needed | Validation method |
|---|---|---|
| H1: Triage or ownership waits contribute to delays | Assigned-at, first-touch time and ownership records | Sample late vs on-time cases; interview agents |
| H2: Specialist dependencies and handoffs lengthen work | Handoff/reassignment counts; dependency type | Trace 20–30 representative tickets per target queue |
| H3: Normal/Low items do not receive timely aging checks | Queue aging snapshots; alert/escalation timestamps | Compare pre-deadline follow-up frequency |

**Decision gate:** Do not attribute delays to a hypothesis until process evidence supports it. Otherwise revise interventions.

## Improve

1. **Queue ownership and review cadence.** Assign one accountable owner per case, add a shared daily aging review in the Technical pilot. Capture ownership/completion in an audit trail.
2. **Pre-deadline escalation (pilot thresholds).** Flag at 48 hours and escalate at 60 hours where still open, while retaining the *same 72-hour measurement rule*; do not improve the metric by changing definitions.
3. **Standardized specialist handoff.** Establish a short problem summary, evidence checklist, receiving owner and response expectation; test with Technical/Integrations specialists.

**Prioritization:** Start with an inexpensive process and measurement pilot rather than claiming the dashboard alone solves the problem. Avoid diverting resources from urgent cases. Review feasibility with stakeholders.

## Control

- **Weekly dashboard:** SLA compliance, breach count, backlog, volume and queue/priority segments.
- **Process monitoring:** cases reviewed by 48 hours, elapsed time to escalation after 60 hours, percent with named owners. Requires new logging; not available in source data.
- **Guardrails:** High/Urgent resolution compliance and outstanding case volume; customer satisfaction only when completeness is adequate.
- **Cadence:** Queue lead weekly operational review; sponsor review at weeks 4, 8 and 12; investigate deteriorating metrics and pause expansion where needed.
- **Outcome integrity:** Compare fresh post-pilot cohorts to baseline; record any changes in queue/priority mix. No causal claim without a credible comparison or explicit limitations.

## Quantitative feasibility check
At an unchanged denominator of 3,775 resolved tickets, 85% compliance corresponds to at least 3,209 compliant cases and no more than 566 breaches — a reduction of **258** from the sample baseline. Reducing Technical breaches alone by 258 would mean eliminating about **70% of its 367 breaches**; therefore, success from a Technical-only intervention cannot be assumed. The pilot should determine whether broader adoption and cross-queue effects are achievable.

## Evidence / assumption register
- **Verified against prior user Power BI and SQLite results:** 4,000 total, 225 open, 824 >72h breaches, the five queue-level breach counts.
- **Calculated from those verified totals:** resolved 3,775; required breach reduction 258; Technical+Integrations share 65.3%.
- **Assumed:** uniform 72h SLA; future 85% stretch target; 48h warning and 60h escalation trigger; all process flow steps until owner interviews.
- **Not available:** company-validated AS-IS procedure, staffing ratios, sequence of handoffs, case-level reasons, implementation or after-state KPI results.
