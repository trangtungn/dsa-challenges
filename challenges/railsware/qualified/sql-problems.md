## Problem: Find the Top-Selling Product

You are given a table called sales with the following schema:

| Column Name    | Data Type |
| ------------- | --------- |
| id            | INT       |
| product_name  | VARCHAR   |
| quantity_sold | INT       |
| sale_date     | DATE      |


Write an SQL query to find the product_name that has the highest total quantity sold. If there is a tie, return all products with the same maximum quantity sold.

Example Data:

| id | product_name | quantity_sold | sale_date  |
| -- | ------------ | ------------- | ---------- |
| 1  | Widget A     | 10            | 2024-11-01 |
| 2  | Widget B     | 15            | 2024-11-02 |
| 3  | Widget A     | 20            | 2024-11-03 |
| 4  | Widget C     | 25            | 2024-11-04 |
| 5  | Widget B     | 10            | 2024-11-05 |

Expected Output:

| product_name |
| ------------ |
| Widget C     |

Solution:

```sql
WITH total_sales AS (
    SELECT
        product_name,
        SUM(quantity_sold) AS total_quantity
    FROM
        sales
    GROUP BY
        product_name
)
SELECT
    product_name
FROM
    total_sales
WHERE
    total_quantity = (SELECT MAX(total_quantity) FROM total_sales);
```
