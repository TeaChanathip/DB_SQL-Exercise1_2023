WITH inst AS(
	SELECT *
	FROM (SELECT product_id, COUNT(product_id) AS count_order
		  FROM order_line
		  GROUP BY product_id
		 )
)

SELECT P.product_id, P.product_description
FROM product P
WHERE P.product_id = ANY(SELECT I1.product_id
					     FROM inst I1
					     WHERE I1.count_order = ANY(SELECT MAX(I2.count_order)
										   	  		FROM inst I2
												   )
					 	);