SELECT product_id, SUM(quantity) as total_sold
FROM order_details
GROUP BY product_id

SELECT product_name
FROM products
RIGHT JOIN (
			SELECT product_id, SUM(quantity) as total_sold
			FROM order_details
			GROUP BY product_id
			) USING (product_id)
WHERE total_sold = 10


SELECT DISTINCT product_name
FROM products
RIGHT JOIN (
			SELECT product_id, quantity
			FROM order_details
			) USING (product_id)
WHERE quantity = 10
			