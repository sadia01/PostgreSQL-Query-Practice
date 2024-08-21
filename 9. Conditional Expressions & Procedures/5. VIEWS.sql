-- Use dvdrental database --

CREATE VIEW customer_info AS 

SELECT first_name last_name, address 
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id;

SELECT * FROM customer_info;

-- REPLACE OR CREATE VIEW

CREATE OR REPLACE VIEW customer_info AS

SELECT first_name last_name, address, district 
FROM customer
INNER JOIN address
ON customer.address_id = address.address_id;

SELECT * FROM customer_info;


-- REMOVE VIEW --
DROP VIEW IF EXISTS customer_info;

-- CHANGE NAME OF THE VIEW --
ALTER VIEW customer_info RENAME TO c_info;

SELECT * FROM c_info;