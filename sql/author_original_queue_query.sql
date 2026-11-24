SELECT queue,count(*) AS time_over_72 FROM "support-tickets"
WHERE (julianday(resolved_at)-julianday(opened_at)) * 24 > 72 
AND resolved_at IS NOT null
GROUP BY queue;
