WITH ProductProfit AS (
    -- Step 1: Calculate total profit for each product
    SELECT
        t.category,
        t.sku,
        SUM(t.amount) AS total_profit,
        ROW_NUMBER() OVER (
            PARTITION BY t.category      -- Grouping by category
            ORDER BY SUM(t.amount) DESC -- Ranking by profit (highest first)
        ) AS profit_rank
    FROM
        raw t  -- Replace 'your_sales_table' with your actual table name
    GROUP BY
        t.category,
        t.sku
)
-- Step 3: Select only the products ranked 1, 2, or 3
SELECT
    "category",
    "sku",
    "total_profit"
FROM
    ProductProfit
WHERE
    "profit_rank" <= 3
ORDER BY
    "category",
    "profit_rank"
LIMIT 10;
