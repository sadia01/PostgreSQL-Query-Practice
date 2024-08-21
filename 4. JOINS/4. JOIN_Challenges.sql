/* 1. California sales tax laws have changed 
and we need to alert our customers about this through email. 
What are the emails of the customers who lives in California? */

SELECT address.district, customer.email
FROM address
INNER JOIN customer
ON address.address_id = customer.address_id
WHERE district ='California' ;



/* A customer walks in and is a huge fan of the actor 
'Nick Wahlberg' and wants to know which movies he is in. 
Get a list of all movies 'Nick Wahlberg' has been in*/

SELECT film.title,actor.first_name,actor.last_name 
FROM actor
INNER JOIN film_actor
ON actor.actor_id = film_actor.actor_id
INNER JOIN film
ON film_actor.film_id = film.film_id
WHERE first_name = 'Nick'
AND last_name = 'Wahlberg'
