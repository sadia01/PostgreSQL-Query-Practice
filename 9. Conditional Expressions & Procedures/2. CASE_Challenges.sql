/* We want to know and compare the various amounts of films we have per movie rating.
USE CASE and the dvdrental database */

SELECT
SUM(
CASE rating
     WHEN 'R' THEN 1 
	 ELSE 0
END
) AS R_rating,

SUM(
CASE rating
     WHEN 'PG' THEN 1 
	 ELSE 0
END
) AS PG_rating,

SUM(
CASE rating
     WHEN 'PG-13' THEN 1 
	 ELSE 0
END
) AS PG_13_rating

FROM film;