WITH "MonthlyAggregates" AS (
    SELECT
        DATE_TRUNC('month', DATE_PARSE("date", '%m-%d-%y')) AS sales_month, 
        SUM("amount") AS current_sales
    FROM raw
    GROUP BY 1 -- Group by sales_month
),
"LaggedMetrics" AS (
    -- Step 2: Use LAG() to fetch the previous month's metrics
    SELECT
        "sales_month",
        "current_sales",
        LAG("current_sales", 1) OVER (ORDER BY "sales_month") AS "previous_month_sales"
    FROM "MonthlyAggregates"
)
SELECT
    "sales_month",
    "current_sales",
    ("current_sales" - "previous_month_sales") * 100.0 / "previous_month_sales" AS "sales_growth_rate_pct"
FROM "LaggedMetrics"
ORDER BY
    "sales_month";
