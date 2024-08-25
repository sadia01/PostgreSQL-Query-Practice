# Setup PostgreSQL and Compressed database to practice

This README provides instructions for setting up PostgreSQL, pgAdmin 4, and restoring a database from a tar file to practice. Follow the steps below to get started.


## Steps

### 1. Download and Install PostgreSQL

- Visit the PostgreSQL download page: [PostgreSQL Downloads](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads)
- Download the installer for your operating system.
- Run the installer and follow the setup instructions.
  - Set a password that you can remember.
  - Choose the default port number `5432`.

### 2. Download and Install pgAdmin 4

- Go to the pgAdmin 4 download page: [pgAdmin 4 Downloads](https://www.pgadmin.org/download/pgadmin-4-windows/)
- Download the installer for your operating system.
- Run the installer and choose the default setup options.

### 3. Download the dvdrental.tar File

- Obtain the `dvdrental.tar` file. Do not open, double-click, or unzip this file.
  - This file contains a compressed version of the practice database.

### 4. Open pgAdmin 4 and Set Up

- Launch the pgAdmin 4 application.
- Set up a password if prompted.

### 5. Connect to the PostgreSQL Server

- Connect to your PostgreSQL server instance within pgAdmin 4.

### 6. Create a New Database

- Right-click on your PostgreSQL version (e.g., PostgreSQL 16).
- Navigate to `Create -> Database`.
  - In the "General" tab, enter `dvdrental` as the name of the database.
  - Click `Save` to create the database.

### 7. Restore the dvdrental Database

- Right-click on the `dvdrental` database you just created.
- Select `Restore`.
- In the "General" section:
  - Choose `Custom or tar` as the Format.
  - Browse and select the `dvdrental.tar` file.
  - In the file dialog, set the filter to "All Files" to make the `.tar` file visible.
- Go to the "Data Options" section:
  - Enable `Pre-data`, `Data`, and `Post-data`.
- Click `Restore` to begin the restoration process.

### 8. Handle Potential Errors

- If a "Failed exit code" error appears, you may safely ignore it.

### 9. Refresh the Database

- Refresh the `dvdrental` database to ensure it has been loaded correctly.

### 10. Access the Query Tool

- Right-click on the `dvdrental` database.
- Select `Query Tool` to start running SQL queries.





# SQL Cheatsheet

## 1. SQL SELECT STATEMENTS 

1. `SELECT * FROM tbl`  
- Select all rows and columns from table tbl 
2. `SELECT c1,c2 FROM tbl` 
- Select column c1, c2 and all rows from table tbl 
3. `SELECT c1,c2 FROM tbl 
WHERE conditions 
ORDER BY c1 ASC, c2 DESC`
- Select columns c1, c2 with where conditions and from table tbl order result by column c1 in ascending order and c2 in descending order 
4. `SELECT DISTINCT c1, c2 FROM tbl` 
- Select distinct rows by columns c1 and c2 from table tbl. 
5. `SELECT c1, aggregate(expr) 
FROM tbl 
GROUP BY c1` 
- Select column c1 and use aggregate function on expression expr, group columns by column c1. 
6. `SELECT c1, aggregate(expr) AS c2 
FROM tbl
GROUP BY c1 HAVING c2 > v `
- Select column c1 and c2 as column alias of the result of aggregate function on expr. Filter group of records with c2 greater than value v 


## 2. SQL UPDATE TABLE 

1. `INSERT INTO tbl(c1,c2,...) 
VALUES(v1,v2...)`
- Insert data into table tbl 
2. `INSERT INTO tbl(c1,c2,...) 
SELECT c1,c2.. FROM tbl2 
WHERE conditions` 
- Insert data from tbl2 into tbl 
3. `UPDATE t SET c1 = v1, c2 = v2... 
WHERE conditions `
- Update data in table tbl 
4. `DELETE FROM tbl 
WHERE conditions `
- Delete records from table tbl based on WHERE conditions. 
5. `TRUNCATE TABLE tbl `
- Drop table tbl and re-create it, all data is lost


## 3. SQL TABLE STATEMENTS 

1. `CREATE TABLE tbl
( c1 datatype(length) 
  c2 datatype(length) 
••• 
 PRIMARY KEY(c1) 
) `
- Create table tbl with primary key is c1 
2. `DROP TABLE tbl `
- Remove table tbl from database. 
3. `ALTER TABLE tbl
 ADD COLUMN c1 datatype(length)` 
- Add column cl to table tbl 
4. `ALTER TABLE tbl 
DROP COLUMN c1` 
- Drop column c1 from table tbl 


## 4. SQL JOIN STATEMENTS 
1. `SELECT * FROM tbl1 
INNER JOIN tbl2 ON join-conditions`
- Inner join table tbl1 with tbl2 based on join-conditions. 
3. `SELECT * FROM tbl1 
LEFT JOIN tbl2 ON join-conditions`
- Left join table tbl1 with tbl2 based on join-conditions.
4. `SELECT * FROM tbl1 
RIGHT JOIN tbl2 ON join-conditions`
- Right join table tbl1 with tbl2 based on join-conditions. 
5. `SELECT * FROM tbl1 
RIGHT JOIN tbl2 ON join-conditions`
- Full outer join table tbl1 with tbl2 based on join-conditions.


# 1. SQL Statement Fundamentals

This README provides examples and challenges for various SQL operations and concepts, including `SELECT`, `JOIN`, `WHERE`, `ORDER BY`, `LIMIT`, and more. 

## Select Statement

### Basic Queries

1. Retrieve all data from all columns of a specific table, e.g., `t3`:
    ```sql
    SELECT * FROM t3;
    ```

2. Retrieve all data from `column1` and `column3` of a specific table, e.g., `t2`:
    ```sql
    SELECT c1, c3 FROM t2;
    ```

3. Retrieve all data from `column2` and `column3` of a specific table, e.g., `t1`:
    ```sql
    SELECT c2, c3 FROM t1;
    ```

### Challenge 1
Use a `SELECT` statement to grab the `first_name`, `last_name`, and `email` of every customer from the `customer` table.

**Answer:**
```sql
SELECT first_name, last_name, email FROM customer;
```

## Select Distinct Statement

If a table contains duplicate values, the `DISTINCT` keyword returns only unique values.

1. Suppose `Table1` has a column named `color` with values like: `Green`, `Blue`, `Black`, `Yellow`, `Blue`, `White`, `Green`.

2. To get only the unique color values:
    ```sql
    SELECT DISTINCT color FROM Table1;
    ```

## Count Statement

1. `COUNT` function returns the number of rows in a table.
2. `COUNT` needs parentheses.
3. Combine `COUNT` with `DISTINCT` to get the count of unique values.

### Challenge 2
1. Get unique `rating` column from the `film` table.
2. Use `DISTINCT` & `COUNT` to retrieve the distinct values of the `amount` column and the number of rows from the `payment` table.

**Answer:**
```sql
SELECT DISTINCT rating FROM film;

SELECT COUNT(DISTINCT amount) FROM payment;
```

## WHERE Statement

The `WHERE` statement allows specifying conditions on columns for rows to be returned.

1. Suppose we have columns `name` and `color` with values:
    - `David (Blue)`, `James (Red)`, `Arthur (Black)`, `David (Yellow)`

2. Retrieve `name` and `color` for `David`:
    ```sql
    SELECT name, color FROM table WHERE name = 'David';
    ```

### Challenge 3
1. What is the email for the customer with the name `Nancy Thomas` from the `customer` table?
2. Can you get the description for the movie `'Outlaw Hanky'` from the `film` table?
3. Can you get the phone number of the customer who lives at `'259 Ipoh Drive'` from the `address` table?

**Answer:**
```sql
SELECT email FROM customer
WHERE first_name = 'Nancy' AND last_name = 'Thomas';

SELECT description FROM film
WHERE title = 'Outlaw Hanky';

SELECT phone FROM address
WHERE address = '259 Ipoh Drive';
```

## ORDER BY Command

`ORDER BY` can be used to sort rows based on a column value, in ascending or descending order.

To sort `first_name` alphabetically from A to Z (default is ascending order). To sort from Z to A, use `DESC`.

## LIMIT Command

`LIMIT` allows you to view only a subset of rows, not the entire table.

### Challenge 4
1. What are the customer IDs of the first 10 customers who created a payment using the `payment` table?
2. What are the titles of the 5 shortest movies (by runtime) using the `film` table?
3. If a customer can watch any movie that is 50 minutes or less, how many options does she have?

**Answer:**
```sql
SELECT customer_id FROM payment
ORDER BY payment_date ASC
LIMIT 10;

SELECT title, length FROM film
ORDER BY length ASC
LIMIT 5;

SELECT COUNT(title) FROM film
WHERE length <= 50;
```

## Between Operator

The `BETWEEN` operator matches a value against a range of values (inclusive).

- `value BETWEEN low AND high`
- Combine `BETWEEN` with `NOT` to exclude values: `value NOT BETWEEN low AND high`.

### Challenge 5
Get all columns from the `payment` table where `payment_date` is between `'2007-02-01'` and `'2007-02-15'`.

**Answer:**
```sql
SELECT * FROM payment
WHERE payment_date BETWEEN '2007-02-01' AND '2007-02-15';
```

## IN Operator

The `IN` operator checks if a value is within a list of multiple options. Use `NOT IN` to exclude options.

### Challenge 6
1. Get the `amount` column from the `payment` table where `amount` is `0.99`, `1.98`, or `1.99`.
2. Get the count of the `amount` column from the `payment` table where `amount` does not include `0.99`, `1.98`, or `1.99`.
3. Get all columns from the `customer` table where `first_name` is `'John'`, `'Jake'`, or `'Julie'`.

**Answer:**
```sql
SELECT amount FROM payment
WHERE amount IN (0.99, 1.98, 1.99);

SELECT COUNT(amount) FROM payment
WHERE amount NOT IN (0.99, 1.98, 1.99);

SELECT * FROM customer
WHERE first_name IN ('John', 'Jake', 'Julie');
```

## LIKE Operator

`LIKE` performs pattern matching against string data using wildcard characters:
- Percent `%` matches any sequence of characters.
- Underscore `_` matches a single character.

`LIKE` is case-sensitive. Use `ILIKE` for case-insensitive matching.

# 2. GROUP BY Statement

## Aggregate Function

Aggregate functions are used in `SELECT` or `HAVING` clauses:

1. `AVG()` - returns the average value.
2. `MAX()` - returns the maximum value.
3. `MIN()` - returns the minimum value.
4. `SUM()` - returns the sum of all values.
5. `COUNT()` - returns the number of values.

## GROUP BY Statement

`GROUP BY` aggregates columns by some category and must appear immediately after `FROM` or `WHERE`. Columns in the `SELECT` statement must either have an aggregate function or be included in the `GROUP BY` clause.

### Challenge 7
1. How many payments did each staff member handle, and who gets the bonus for handling the most payments?
2. What is the average replacement cost per MPAA rating?
3. What are the customer IDs of the top 5 customers by total spend?

**Answer:**
```sql
SELECT staff_id, COUNT(amount) FROM payment
GROUP BY staff_id;

SELECT rating, ROUND(AVG(replacement_cost), 2) FROM film
GROUP BY rating;

SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 5;
```

## HAVING Statement

`HAVING` filters results after `GROUP BY`, using aggregate functions.

### Challenge 8
1. What customer IDs are eligible for platinum status, having had 40 or more transaction payments?
2. What are the customer IDs of customers who have spent more than $100 in payment transactions with staff member 2?

**Answer:**
```sql
SELECT customer_id, COUNT(amount) FROM payment
GROUP BY customer_id
HAVING COUNT(amount) >= 40;

SELECT customer_id, SUM(amount) FROM payment
WHERE staff_id = 2
GROUP BY customer_id
HAVING SUM(amount) > 100
LIMIT 5;
```


# 3. JOINS

### AS Statement

The `AS` clause creates an alias for a column or result. Aliases cannot be used in `WHERE` or `HAVING` clauses.

### INNER JOIN

Returns records that match in both tables. The order of tables does not matter.

### OUTER JOIN

Specifies how to handle values only present in one of the tables being joined.

1. **FULL OUTER JOIN** - Includes unmatched rows from both tables.
2. **LEFT OUTER JOIN** - Includes rows from the left table and nulls for unmatched rows in the right table.
3. **RIGHT OUTER JOIN** - Includes rows from the right table and nulls for unmatched rows in the left table.

### UNION JOIN

Combines the result-set of two or more `SELECT` statements, concatenating results.

# 4. Advanced SQL Commands

This README provides information on Timestamps, Extract, SQL subqueries, self joins, data types, primary and foreign keys, and constraints. It also includes practice instructions for the database assessment.

## Timestamps 

1. `SHOW TIMEZONE()` - Shows the current time zone.
2. `SELECT NOW()` - Shows timestamp with time zone.
3. `SELECT TIMEOFDAY()` - Shows timestamp with time zone as a string.
4. `SELECT CURRENT_TIME` - Returns the time of the time zone.
5. `SELECT CURRENT_DATE` - Returns the current date.

## Extract

Extracts components from a date or timestamp:
- `EXTRACT()` - Extracts sub-components (YEAR, MONTH, DAY, etc.).
  - Usage: `SELECT EXTRACT(MONTH FROM date_col)`
- `AGE()` - Calculates and returns age given a timestamp.
  - Usage: `AGE(date_col)`
- `TO_CHAR()` - Converts data types to text, useful for formatting timestamps.
  - Usage: `TO_CHAR(date_col, 'mm-dd-yyyy')`


## SUB QUERY

A sub query allows to construct complex queries, essentially performing a query on the results of another query. It involves two `SELECT` statements.

- The subquery is performed first since it is inside the parenthesis.
- We can also use the `IN` operator in conjunction with a subquery to check against multiple results returned.
- The `EXISTS` operator is used to test for existence of rows in a subquery.
- Typically a subquery is passed in any rows are returned with the subquery.

## SELF JOIN

It is a query in which a table is joined to itself. `SELF JOIN` is useful for comparing values in a column of rows within the same table.

- It can be viewed as a join of two copies of the same table.
- The table is not actually copied, but SQL performs the command as though it were.
- There is no special keyword for a self join, it's simply standard `JOIN` syntax with the same table in both parts.
- When using a self join it is necessary to use an alias for the table. otherwise the table names would be ambiguous.

## Assessment 2:  Practice on `exercises.tar` Database for Assessment 2 Task

Restore the database and use `cd schema`.

# 5. Creating Databases & Tables

## DATA TYPES

When creating databases and tables, should carefully consider which data types should be used for the data to be stored.

1. **Boolean** - TRUE OR FALSE
2. **Character** - `char`, `varchar`, and `text`
3. **Numeric** - integral and floating-point number
4. **Temporal** - `date`, `time`, `timestamp`, and `interval`
5. **UUID** - Universally Unique Identifiers
6. **Array** - Stores an array of strings, numbers, etc.
7. **JSON**
8. **Hstore** - key-value pair
9. **Special types** - such as network address and geometric data

## PRIMARY KEY

- A primary key is a column or a group of columns used to identify a row uniquely in a table.
- They allow us to easily discern what columns should be used for joining tables together.

## FOREIGN KEY

- It is a field or group of fields in a table that uniquely identifies a row in another table.
- A foreign key is defined in a table that references to the primary key of the other table.
- The table that contains the foreign key is called referencing table or child table.
- The table to which the foreign key references is called referenced table or parent table.
- A table can have multiple foreign keys depending on its relationships with other tables.
- When creating tables and defining columns, we can use constraints to define columns as being a primary key, or attaching a foreign key relationship to another table.

## CONSTRAINTS

- Constraints are the rules enforced on data columns on table.
- These are used to prevent invalid data from being entered into the database.
- This ensures the accuracy and reliability of the data in the database.
- Constraints can be divided into two main categories:
  1. **Column Constraints**
    - Constraints the data in a column to adhere to certain conditions.
  2. **Table Constraints**
    - Applied to the entire table rather than to an individual column.

- The most common constraints used:
  1. **NOT NULL Constraint**
    - Ensures that a column can't have `NULL` value.
  2. **UNIQUE Constraint**
    - Ensures that all values in a column are different.
  3. **PRIMARY KEY**
    - Uniquely identifies each row/record in a database table.
  4. **FOREIGN KEY**
    - Constrains data based on columns in other tables.
  5. **CHECK Constraint**
    - Ensures that all values in a column satisfy certain conditions.
  6. **Exclusion Constraint**
    - Ensures that if any two rows are compared on the specified column or expression using the specified operator, not all of these comparisons will return TRUE.
  7. **Table Constraints**
     1. **CHECK(condition)**
        - To check a condition when inserting or updating data.
     2. **REFERENCES**
        - To constrain the values stored in the column that must exist in a column in another table.
     3. **UNIQUE(column_list)**
       - Forces the values stored in the columns listed inside the parentheses to be unique.
     4. **PRIMARY KEY(column_list)**
       - Allows you to define the primary key that consists of multiple columns.



# SQL Clauses Guide

This document provides a comprehensive overview of various SQL clauses including `CREATE`, `INSERT`, `UPDATE`, `DELETE`, `ALTER`, `DROP`, and `CHECK` constraints. Each section covers the general syntax, usage, and specific details relevant to these SQL operations.

## CREATE CLAUSE

The `CREATE TABLE` statement is used to create a new table in a database.

### General Syntax for Creating a Table

```sql
CREATE TABLE table_name
( column_name TYPE column_constraint,
  column_name TYPE column_constraint,
  table_constraint table_constraint
) INHERITS existing_table_name;
```

### SERIAL TYPE

- Creates a sequence object and sets the next value generated by the sequence as the default value for the column.
- Ideal for primary keys as it automatically logs unique integer entries upon insertion.
- Note: If a row is removed, the column with the `SERIAL` data type does not adjust, showing gaps in the sequence (e.g., 1, 2, 3, 5, 6, 7), indicating that a row was removed.

## INSERT CLAUSE

The `INSERT INTO` statement adds new rows to a table.

### General Syntax

```sql
INSERT INTO table(column1, column2,..)
VALUES (value1, value2,...),
       (value1, value2,...), …;
```

### Syntax for Inserting Values from Another Table

```sql
INSERT INTO table(column1, column2,..)
SELECT column1, column2,...
FROM another_table
WHERE condition;
```

- Inserted row values must match the table’s constraints.
- `SERIAL` columns do not require a value to be provided.

## UPDATE CLAUSE

The `UPDATE` statement modifies existing rows in a table.

### General Syntax

```sql
UPDATE table
SET column1 = value1, 
    column2 = value2,...
WHERE condition;
```

### UPDATE JOIN General Syntax

```sql
UPDATE TableA
SET original_col = TableB.new_col
FROM tableB
WHERE TableA.id = TableB.id;
```

### RETURN Affected Rows Syntax

```sql
UPDATE account
SET last_login = created_on
RETURNING account_id, last_login;
```

## DELETE CLAUSE

The `DELETE` statement removes rows from a table.

### General Syntax

```sql
DELETE FROM table
WHERE row_id = 1;
```

### DELETE JOIN

Deletes rows based on their presence in another table.

```sql
DELETE FROM tableA
USING tableB
WHERE tableA.id = TableB.id;
```

### Deleting All Rows from a Table

```sql
DELETE FROM table;
```

### RETURNING Deleted Rows Syntax

Similar to the `UPDATE` command, you can use `RETURNING` to return rows that were removed.

## ALTER CLAUSE

The `ALTER TABLE` statement modifies the structure of an existing table.

### General Syntax

```sql
ALTER TABLE table_name action;
```

### Adding Columns Syntax

```sql
ALTER TABLE table_name
ADD COLUMN new_col TYPE;
```

### Removing Columns Syntax

```sql
ALTER TABLE table_name
DROP COLUMN col_name;
```

### Alter Constraints Syntax

```sql
ALTER TABLE table_name
ALTER COLUMN col_name
SET DEFAULT value;
-- DROP DEFAULT --
-- SET NOT NULL --
-- DROP NOT NULL --
-- ADD CONSTRAINT constraint_name --
```

## DROP CLAUSE

The `DROP` statement removes a column from a table.

- In PostgreSQL, this also automatically removes all indexes and constraints involving the column.
- It does not remove columns used in views, triggers, or stored procedures without the `CASCADE` clause.

### General Syntax

```sql
ALTER TABLE table_name
DROP COLUMN col_name;
```

### Remove All Dependencies

```sql
ALTER TABLE table_name
DROP COLUMN col_name CASCADE;
```

### Check for Existence to Avoid Error

```sql
ALTER TABLE table_name
DROP COLUMN IF EXISTS col_name;
```

### Drop Multiple Columns Syntax

```sql
ALTER TABLE table_name
DROP COLUMN col_one,
DROP COLUMN col_two;
```

## CHECK Constraints

The `CHECK` constraint enforces custom conditions on column values.

### General Syntax

```sql
CREATE TABLE example(
    ex_id SERIAL PRIMARY KEY,
    age SMALLINT CHECK (age > 21),
    parent_age SMALLINT CHECK (parent_age > age)
);
```

## Assessment 3:  Practice Task Assessment 3


# 6. Conditional Expressions & Procedures

## CASE Statement

The `CASE` statement is used to execute SQL code conditionally, similar to `IF/ELSE` statements in other programming languages. There are two main ways to use a `CASE` statement:

1. **General CASE**: A simple case where you define conditions and their corresponding results.
2. **CASE Expression**: Evaluates an expression and compares the result with each value in the `WHEN` clauses sequentially.

### General CASE Syntax

```sql
CASE 
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ELSE some_other_result
END
```

### CASE Expression Syntax

```sql
CASE expression
    WHEN value1 THEN result1  
    WHEN value2 THEN result2
    ELSE some_other_result
END
```

## COALESCE Function

The `COALESCE` function returns the first argument that is not `NULL`. If all arguments are `NULL`, it returns `NULL`. This function is useful when querying a table with `NULL` values and substituting them with another value.

### COALESCE Syntax

```sql
COALESCE (arg_1, arg_2, ..., arg_n)
```

**Examples:**
- `SELECT COALESCE(1, 2)` -> `1`
- `SELECT COALESCE(NULL, 2, 3)` -> `2`
- `SELECT item, (price - COALESCE(discount, 0)) AS final FROM table;`

## CAST Function & CAST Operator

The `CAST` function and `CAST` operator allow you to convert from one data type to another. Not all data types can be converted to each other; the conversion must be reasonable.

### CAST Function Syntax

```sql
SELECT CAST('5' AS INTEGER);
```

### PostgreSQL CAST Operator Syntax

```sql
SELECT '5'::INTEGER;
```

You can also use this in a `SELECT` query with a column name:

```sql
SELECT CAST(date AS TIMESTAMP)
FROM table;
```

## NULLIF Function

The `NULLIF` function takes two inputs and returns `NULL` if both inputs are equal. Otherwise, it returns the first argument.

### NULLIF Syntax

```sql
NULLIF(arg1, arg2)
```

**Example:**
- `NULLIF(10, 10)` -> Returns `NULL`

## VIEWS

Views are useful for frequently used combinations of tables and conditions. Instead of repeating the same query, you can create a view to simplify access to this query.

- A view is a database object that stores a query.
- In PostgreSQL, a view is accessed as a virtual table.
- A view does not store data physically but stores the query.
- Existing views can be altered or updated.

**Example:**
```
- `NULLIF(10, 12)` -> Returns `10`
```
