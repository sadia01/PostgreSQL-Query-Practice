SELECT title,rental_rate
FROM film
WHERE rental_rate >
(SELECT AVG(rental_rate) FROM film)



SELECT film_id,title
FROM film
WHERE film_id IN
(SELECT inventory.film_id
FROM rental
INNER JOIN inventory ON
inventory.inventory_id = rental.inventory_id
WHERE rental.return_date BETWEEN '2005-05-29' AND '2005-05-30');



SELECT first_name, last_name
FROM customer AS c
WHERE EXISTS
(SELECT * FROM payment as p
WHERE p.customer_id = c.customer_id
AND amount > 11);


SELECT first_name, last_name
FROM customer AS c
WHERE NOT EXISTS
(SELECT * FROM payment as p
WHERE p.customer_id = c.customer_id
AND amount > 11);