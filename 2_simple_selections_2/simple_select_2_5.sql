SELECT AVG(shipped_date - order_date)
FROM orders
WHERE ship_country IN ('USA')