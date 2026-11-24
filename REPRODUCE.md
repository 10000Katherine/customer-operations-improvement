# Reproduction guide

1. Download [data/support-tickets.csv](data/support-tickets.csv). It is a public **synthetic** dataset sourced from [Datanemics](https://datanemics.com/datasets/support-tickets/).
2. In **DB Browser for SQLite**, choose **File → Import → Table from CSV**. Set table name `support-tickets`, enable **Column names in first line**, then import.
3. Run [sql/kpi_analysis.sql](sql/kpi_analysis.sql) in the **Execute SQL** tab.
4. Verify **4,000 tickets**, **225 open**, **824 breaches**, and breaches by queue: account 85; billing 123; integrations 171; onboarding 78; technical 367.
5. The Power BI source file is available in the separately provided local portfolio ZIP and is pending binary upload to `powerbi/operations_dashboard.pbix`; see [Power BI instructions](powerbi/README.md). After upload, open it in Power BI Desktop and update the Power Query CSV source path if required.
6. In Power BI, the **Monthly Ticket Volume** chart excludes incomplete February 2024 by visual-level date filter `opened_at < 2024-02-01 00:00`; all dashboard KPI totals still use the complete extract.

No real business uplift was measured. The 85% SLA rate is a proposed target, not an achieved result.
