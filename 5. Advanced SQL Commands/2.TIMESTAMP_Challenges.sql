-- During which months did payment occur?--

SELECT DISTINCT(TO_CHAR(payment_date, 'MONTH'))
FROM payment;

-- How many payments occured on MONDAY--

SELECT COUNT(*) FROM payment
WHERE EXTRACT (dow FROM payment_date)=1;
 
