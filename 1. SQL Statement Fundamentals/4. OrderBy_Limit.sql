SELECT customer_id From payment
ORDER BY payment_date ASC
LIMIT 10;

SELECT title, length FROM film
ORDER BY length ASC
LIMIT 10;

SELECT COUNT(title) length FROM film
WHERE length<=50;