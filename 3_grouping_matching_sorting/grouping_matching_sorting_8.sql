SELECT country
FROM customers
INTERSECT 
SELECT country
FROM suppliers
INTERSECT
SELECT country
FROM employees
