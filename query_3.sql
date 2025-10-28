SELECT
    "category",
    SUM(CASE WHEN "promotion-ids" IS NOT NULL THEN "amount" ELSE 0 END) AS "total_promoted_sales",
    SUM(CASE WHEN "promotion-ids" IS NULL THEN "amount" ELSE 0 END) AS "total_non_promoted_sales",
    SUM(CASE WHEN "promotion-ids" IS NOT NULL THEN "amount" ELSE 0 END) - SUM(CASE WHEN "promotion-ids" IS NULL THEN "amount" ELSE 0 END)  as "discount_profit"
FROM
    raw
GROUP BY
    "category"
ORDER BY
    "discount_profit"
LIMIT 10;
