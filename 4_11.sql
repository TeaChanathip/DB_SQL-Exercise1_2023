SELECT C.customer_id, C.customer_name
FROM customer C
WHERE NOT EXISTS (SELECT DISTINCT O.customer_id
					FROM ordert O
					WHERE O.customer_id = C.customer_id	
				 )
ORDER BY C.customer_id;