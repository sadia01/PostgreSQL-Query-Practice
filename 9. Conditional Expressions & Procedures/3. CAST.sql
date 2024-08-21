SELECT CAST('5' AS INTEGER) AS new_int;

SELECT '10':: INTEGER;


-- Number of digits in inventory_id --

SELECT CHAR_LENGTH(CAST(inventory_id AS VARCHAR))
FROM rental;