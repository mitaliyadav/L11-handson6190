SELECT
    DATE_PARSE("date", '%m-%d-%y') AS final_date,
    SUM("amount") AS total_sales
FROM
    raw
WHERE
    YEAR(DATE_PARSE("date", '%m-%d-%y')) = 2022 -- 1. WHERE clause comes before GROUP BY
GROUP BY
    DATE_PARSE("date", '%m-%d-%y')             -- 2. Use the function or a column name that exists before this point (can't use the alias 'final_date' here)
ORDER BY
    final_date                                 -- 3. Order by the parsed date alias
LIMIT 10;
