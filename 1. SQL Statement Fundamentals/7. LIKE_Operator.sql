SELECT first_name,last_name FROM customer
WHERE first_name LIKE '_er%' AND last_name ILIKE '%ff%';

SELECT first_name,last_name FROM customer
WHERE first_name LIKE 'A%' AND last_name NOT LIKE 'B%'
ORDER BY last_name;