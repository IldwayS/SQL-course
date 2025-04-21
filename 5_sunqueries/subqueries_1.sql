SELECT AVG(quantity)
FROM order_details
GROUP BY product_id
ORDER BY AVG(quantity) DESC;


SELECT product_name, units_in_stock
FROM products
WHERE units_in_stock < ALL(
						SELECT AVG(quantity)
						FROM order_details
						GROUP BY product_id
						ORDER BY AVG(quantity)
)
ORDER BY units_in_stock DESC
