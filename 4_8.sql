SELECT customer_id, customer_name, COUNT(order_id) AS number_of_orders
FROM (customer NATURAL JOIN ordert)
GROUP BY customer_id
ORDER BY number_of_orders DESC
FETCH FIRST 3 ROW ONLY;