WITH inst AS(
	SELECT *
	FROM (SELECT product_id, SUM(ordered_quantity) AS culm_quantity
		  FROM order_line
		  GROUP BY product_id
		 )
)

SELECT P.product_id, P.product_description
FROM product P
WHERE P.product_id = ANY(SELECT I1.product_id
					     FROM inst I1
					     WHERE I1.culm_quantity = ANY(SELECT MAX(I2.culm_quantity)
										   	  		FROM inst I2
												   )
					 	);