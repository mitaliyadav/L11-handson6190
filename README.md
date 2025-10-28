## Q1 - Daily Sales for 2022 Analysis
### Approach
Data Conversion: Convert the string-based "date" column to a proper date type using DATE_PARSE.

Filtering: Use the YEAR() function on the parsed date within the WHERE clause to restrict results to the year 2022.

Aggregation: Group the resulting rows by the converted date to correctly total sales for each day.

Sorting & Limiting: Order the aggregated results chronologically and display only the top 10 rows.

## Q2 - Top 10 States by Total Sales Analysis
### Approach
Aggregation: Group the transactional data by the shipping state.

Calculation: Sum the sales amounts within each state group to determine the total sales per state.

Sorting and Limitation: Order the resulting states from highest total sales to lowest and restrict the output to the top 10 states.

## Q3 - Top 10 States by Total Sales Analysis
### Approach
Aggregation: Group the transactional data by the shipping state.

Calculation: Sum the sales amounts within each state group to determine the total sales per state.

Sorting and Limitation: Order the resulting states from highest total sales to lowest and restrict the output to the top 10 states.

## Q4 -  Top 3 Most Profitable Products Per Category Analysis
### Approach
Initial Aggregation (CTE): The query first calculates the total profit for every unique product (sku) by aggregating the amount column, grouped by its category.

Window Ranking: It then uses the ROW_NUMBER() window function to assign a sequential rank to each product, with the rank resetting to 1 for every new category encountered. The rank is determined by the total_profit (highest profit gets rank 1).

Filtering: The final query filters the results from the ranked set to keep only those products with a rank of 1, 2, or 3.

Limitation: The final results are limited to the top 10 rows overall, sorted by category and rank.

## Q5 - Monthly Sales Growth Rate Analysis
### Approach
Initial Aggregation (CTE: MonthlyAggregates): Aggregate the raw daily data into monthly totals for sales. The date string is first parsed and then truncated to the start of the month for accurate grouping.

Previous Period Access (CTE: LaggedMetrics): Use the LAG() window function to retrieve the sales total from the immediately preceding month, preparing for the growth calculation.

Final Calculation: Compute the MoM growth rate using the formula: $(\frac{\text{Current Sales} - \text{Previous Sales}}{\text{Previous Sales}}) \times 100$.

## AWS Configurations:

### Cloudwatch:

<img width="3771" height="1645" alt="image" src="https://github.com/user-attachments/assets/defa0c17-5135-434a-a815-9b60f77744ea" />

### IAM Roles:

<img width="3774" height="1498" alt="image" src="https://github.com/user-attachments/assets/51a131b5-ce60-4ceb-8301-27f4a22c9a71" />

### S3 Buckets:

<img width="3792" height="1284" alt="image" src="https://github.com/user-attachments/assets/9ab968d8-8518-4eb0-9329-0c86fb426fea" />

<img width="2990" height="1334" alt="image" src="https://github.com/user-attachments/assets/def4cf0f-52ee-40a4-9366-9b0073ca771a" />





