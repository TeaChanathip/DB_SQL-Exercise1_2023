WITH inst AS(
	SELECT customer_id, customer_name, COUNT(order_id) AS number_of_orders
	FROM (customer NATURAL JOIN ordert)
	GROUP BY customer_id
)

SELECT customer_id, customer_name
FROM (SELECT customer_id, customer_name, number_of_orders
	  FROM inst
	  WHERE number_of_orders = ANY(SELECT MAX(number_of_orders)
							       FROM inst
								  )
	 );