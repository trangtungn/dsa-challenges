## Duplicates in a table

### Query to verify duplicates exist

```sql
SELECT username, email, COUNT(*)
FROM users
GROUP BY username, email
HAVING COUNT(*) > 1
```

### List entire rows with duplicates

```sql
SELECT a.*
FROM users a
INNER JOIN (
    SELECT username, email, COUNT(*)
    FROM users
    GROUP BY username, email
    HAVING count(*) > 1
) b ON a.username = b.username AND a.email = b.email
ORDER BY a.email
```

## CTE - Avg monthly cost by campaign

```sql
-- define CTE:
WITH Cost_by_Month AS
(SELECT campaign_id AS campaign,
       TO_CHAR(created_date, 'YYYY-MM') AS month,
       SUM(cost) AS monthly_cost
FROM marketing
WHERE created_date BETWEEN NOW() - INTERVAL '3 MONTH' AND NOW()
GROUP BY 1, 2
ORDER BY 1, 2)

-- use CTE in subsequent query:
SELECT campaign, avg(monthly_cost) as "Avg Monthly Cost"
FROM Cost_by_Month
GROUP BY campaign
ORDER BY campaign
```

Using a derived query:

```sql
SELECT campaign, avg(monthly_cost) as "Avg Monthly Cost"
FROM
    -- this is where the derived query is used
    (SELECT campaign_id AS campaign,
       TO_CHAR(created_date, 'YYYY-MM') AS month,
       SUM(cost) AS monthly_cost
    FROM marketing
    WHERE created_date BETWEEN NOW() - INTERVAL '3 MONTH' AND NOW()
    GROUP BY 1, 2
    ORDER BY 1, 2) as Cost_By_Month
GROUP BY campaign
ORDER BY campaign
```

## Regex

- [Metacharacters](https://www.atlassian.com/data/sql/how-regex-works-in-sql)

```sql
SELECT * FROM Email Addresses
WHERE Email Address ~* '%@chartio.com'
```

- [Comparators](https://www.atlassian.com/data/sql/how-regex-works-in-sql)

## SQL Join types

- [SQL Joins Explained Visually](https://www.atlassian.com/data/sql/sql-join-types-explained-visually)

### Outer join

### Inner join

### Left join

### Right join

### Union and Cross Join

## Indexing

### Types of indexing

There are two types of databases indexes:

1. Clustered (Primary)
2. Non-clustered (Secondary)

Both clustered and non-clustered indexes are stored and searched as B-trees, a data structure similar to a binary tree.

![B-Tree](../../assets/images/sql/sql_b_tree_index.png)

### Clustered (Primary) Indexes

Clustered indexes are the unique index per table that uses the primary key to organize the data that is within the table.

The clustered index ensures that the primary key is stored in increasing order, which is also the order the table holds in memory.

- Clustered indexes do not have to be explicitly declared.
- Automatically created when the table is created.
- Use the primary key sorted in ascending order.

```sql
CREATE TABLE friends (id INT PRIMARY KEY, name VARCHAR, city VARCHAR);
```

The clustered index will be automatically created when the primary key is defined:

![Clustered Indexes](../../assets/images/sql/sql_clustered_indexes.png)

### Non-clustered or Secondary indexes

Non-clustered indexes are sorted references for a specific field, from the main table, that hold pointers back to the original entries of the table.

![Non-clustered Indexes](../../assets/images/sql/sql_non_clustered_indexes.png)

**Note:** Non-clustered indexes are not new tables. Non-clustered indexes hold the field that they are responsible for sorting and a pointer from each of those entries back to the full entry in the table.

[!Non-clustered Index Example](../../assets/images/sql/sql_non_clustered_index_ex.png)

**Note:** Non-clustered indexes point to memory addresses instead of storing data themselves. This makes them slower to query than clustered indexes but typically much faster than a non-indexed column.

```sql
CREATE INDEX friends_name_asc ON friends(name ASC);
```

### When to use Indexes

To speed up the performance of a database:
- use indexes on columns that are frequently used in WHERE clauses
- use indexes on columns that are frequently used in JOIN clauses
- use indexes on columns that are frequently used in ORDER BY or GROUP BY clauses
- avoid indexing columns that are frequently updated

### When not to use Indexes

Every time a write is made to the database, the indexes are unusable until they have updated.
- Columns that are frequently updated
- Columns that have a small number of distinct values

### Testing Index performance

```sql
EXPLAIN ANALYZE SELECT * FROM friends WHERE name = 'Blake';
```

## Multicolumn indexes
Multicolumn indexes can:

- be created on up to 32 columns
- be used for partial indexing
- only use: b-tree, GIN, BRIN, and GiST structures

## Appendix

### Index Structure

![Index Structure](../../assets/images/sql/sql_index_structure.png)

### Index Types

![Index Types](../../assets/images/sql/sql_index_types.png)

### Dense Index

![Dense Index](../../assets/images/sql/sql_dense_index.png)

### Sparse Index

![Sparse Index](../../assets/images/sql/sql_sparse_index.png)

### Clustered Indexing Example

![Clustered Indexing Example](../../assets/images/sql/sql_clustered_index.png)

### Non-clustered Indexing Example

![Non-clustered Indexing Example](../../assets/images/sql/sql_non_clustered_indexing.png)

### Multilevel Indexing

![Multilevel Indexing](../../assets/images/sql/sql_multilevel_indexing.png)
