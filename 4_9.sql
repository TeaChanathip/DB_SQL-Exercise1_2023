SELECT DISTINCT O.customer_id, C.customer_name
FROM customer C, ordert O
WHERE (O.order_date BETWEEN '2020-01-10 00:00:00' AND '2020-01-15 23:59:59') AND O.customer_id = C.customer_id;