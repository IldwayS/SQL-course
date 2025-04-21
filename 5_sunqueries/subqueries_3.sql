SELECT order_id, SUM(unit_price * quantity * (1 - discount)) as order_price
FROM order_details
GROUP BY order_id
ORDER BY order_id


SELECT customer_id, ship_country, order_price
FROM orders
JOIN (
		SELECT order_id, SUM(unit_price * quantity * (1 - discount)) as order_price
		FROM order_details
		GROUP BY order_id
		) USING (order_id)
WHERE ship_country IN ('Argentina', 'Bolivia', 'Brazil', 'Chile', 
'Colombia', 'Ecuador', 'Guyana', 'Paraguay',
'Peru', 'Suriname', 'Uruguay', 'Venezuela') AND order_date >= '1997-09-01'
ORDER BY order_price DESC
LIMIT 3