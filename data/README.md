# Dataset provenance

The file `support-tickets.csv` contains **4,000 synthetic** customer support tickets sourced from [Datanemics — Support Tickets](https://datanemics.com/datasets/support-tickets/). The publisher labels the source dataset as **CC0**.

This is **not** customer PII or observed company data. Keep missing values as missing. `resolved_at IS NULL` is interpreted as unresolved at extraction and is **not automatically overdue**. The static extract ends on February 4, 2024; exclude February 2024 from comparisons of complete calendar months only.
