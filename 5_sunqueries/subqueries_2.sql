
SELECT customer_id, SUM(freight) as freight_sum
FROM orders
JOIN (
		SELECT customer_id, AVG(freight) as freight_avg
		FROM orders
		GROUP BY customer_id
		) USING (customer_id)
		
WHERE shipped_date BETWEEN '1996-07-15' AND '1996-08-01' AND freight >= freight_avg
GROUP BY customer_id
ORDER BY freight_sum