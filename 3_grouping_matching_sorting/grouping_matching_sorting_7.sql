SELECT country
FROM customers
UNION 
SELECT country
FROM suppliers
ORDER BY country ASC