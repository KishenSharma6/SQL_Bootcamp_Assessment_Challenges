/*What customer has the highest customer ID number whose name starts 
with an 'E' and has an address ID lower than 500?*/

SELECT first_name, last_name, customer_id, address_id
FROM customer
WHERE first_name LIKE 'E%' and address_id <500
ORDER BY customer_id DESC
LIMIT 1;