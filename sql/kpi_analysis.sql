-- SQLite validation for synthetic SaaS support tickets
-- Assumed resolution SLA: 72 hours (inclusive is compliant)
-- Table name created by DB Browser from support-tickets.csv: "support-tickets"

-- 1. Baseline counts
SELECT COUNT(*) AS total_tickets,
       SUM(CASE WHEN resolved_at IS NULL THEN 1 ELSE 0 END) AS open_backlog,
       SUM(CASE WHEN resolved_at IS NOT NULL THEN 1 ELSE 0 END) AS resolved_tickets
FROM "support-tickets";

-- 2. Resolution SLA breaches across resolved valid-duration tickets
SELECT COUNT(*) AS sla_breaches
FROM "support-tickets"
WHERE resolved_at IS NOT NULL
  AND julianday(resolved_at) >= julianday(opened_at)
  AND (julianday(resolved_at) - julianday(opened_at))*24 > 72;

-- 3. Queue-level SLA breaches
SELECT queue, COUNT(*) AS sla_breaches
FROM "support-tickets"
WHERE resolved_at IS NOT NULL
  AND julianday(resolved_at) >= julianday(opened_at)
  AND (julianday(resolved_at)-julianday(opened_at))*24 > 72
GROUP BY queue
ORDER BY sla_breaches DESC;

-- 4. Queue volume, backlog and average resolution (in hours)
SELECT queue,
       COUNT(*) AS total_tickets,
       SUM(CASE WHEN resolved_at IS NULL THEN 1 ELSE 0 END) AS open_backlog,
       ROUND(AVG(CASE WHEN resolved_at IS NOT NULL
                      AND julianday(resolved_at) >= julianday(opened_at)
                      THEN (julianday(resolved_at)-julianday(opened_at))*24
                 END),2) AS avg_resolution_hours
FROM "support-tickets"
GROUP BY queue
ORDER BY total_tickets DESC;

-- 5. Queue-priority breach distribution
SELECT queue, priority,
       COUNT(*) AS total_tickets,
       SUM(CASE WHEN resolved_at IS NULL THEN 1 ELSE 0 END) AS open_backlog,
       SUM(CASE WHEN resolved_at IS NOT NULL
                AND julianday(resolved_at) >= julianday(opened_at)
                AND (julianday(resolved_at)-julianday(opened_at))*24 >72
                THEN 1 ELSE 0 END) AS sla_breaches
FROM "support-tickets"
GROUP BY queue, priority
ORDER BY queue, priority;

-- 6. Overall SLA Compliance (resolved valid-duration tickets)
WITH r AS (
    SELECT (julianday(resolved_at)-julianday(opened_at))*24 AS duration_h
    FROM "support-tickets"
    WHERE resolved_at IS NOT NULL
      AND julianday(resolved_at) >= julianday(opened_at)
)
SELECT COUNT(*) AS resolved_valid_tickets,
       SUM(CASE WHEN duration_h <=72 THEN 1 ELSE 0 END) AS sla_met,
       SUM(CASE WHEN duration_h >72 THEN 1 ELSE 0 END) AS sla_breaches,
       ROUND(100.0 * SUM(CASE WHEN duration_h <=72 THEN 1 ELSE 0 END)
             / NULLIF(COUNT(*),0), 2) AS sla_compliance_pct
FROM r;

-- 7. First response average, ignoring missing values
SELECT ROUND(AVG(first_response_min),2) AS avg_first_response_min
FROM "support-tickets";
