SELECT SUM(total_price) AS total_payment
FROM (SELECT order_id, standard_price*ordered_quantity AS total_price
	  FROM product P NATURAL JOIN order_line L)
WHERE order_id = 3;