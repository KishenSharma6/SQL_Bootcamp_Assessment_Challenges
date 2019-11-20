/*Return the customer IDs of customers who have spent at least $110 
with the staff member who has an ID of 2.*/

SELECT customer_id, staff_id, SUM(amount)
FROM payment
GROUP BY customer_id, staff_id
HAVING SUM(amount)>=110 and staff_id = 2