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

## SQL SELECT STATEMENTS 

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


## SQL UPDATE TABLE 

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


## SQL TABLE STATEMENTS 

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


## SQL JOIN STATEMENTS 
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
