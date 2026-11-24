# Power BI KPI measures and report notes

The Power BI source model uses table `support-tickets`.

```dax
Open Backlog =
CALCULATE(
    COUNTROWS('support-tickets'),
    ISBLANK('support-tickets'[resolved_at])
)
```

```dax
Avg First Response =
AVERAGE('support-tickets'[first_response_min])
```

```dax
Avg Resolution Hours =
AVERAGEX(
    FILTER('support-tickets',
        NOT ISBLANK('support-tickets'[resolved_at])
    ),
    DATEDIFF('support-tickets'[opened_at],
             'support-tickets'[resolved_at], MINUTE)/60
)
```

```dax
SLA Breaches =
COALESCE(
    COUNTROWS(
        FILTER('support-tickets',
            NOT ISBLANK('support-tickets'[resolved_at])
            && 'support-tickets'[resolved_at] >= 'support-tickets'[opened_at]
            && DATEDIFF('support-tickets'[opened_at],
                        'support-tickets'[resolved_at], MINUTE) > 4320
        )
    ), 0
)
```

```dax
SLA Compliance % =
VAR Resolved =
    FILTER('support-tickets',
        NOT ISBLANK('support-tickets'[resolved_at])
        && 'support-tickets'[resolved_at] >= 'support-tickets'[opened_at]
    )
RETURN
DIVIDE(
    COUNTROWS(
        FILTER(Resolved,
            DATEDIFF('support-tickets'[opened_at],
                     'support-tickets'[resolved_at], MINUTE) <= 4320
        )
    ),
    COUNTROWS(Resolved)
)
```

**Format:** SLA Compliance as Percentage (two decimals); Total Tickets as full numeric display; first response in minutes; resolution in hours. The monthly volume visual filters original `opened_at` to strictly before **2024-02-01 12:00 AM** to exclude partial February 2024. Keep this filter on the visual only.
