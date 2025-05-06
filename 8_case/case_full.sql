insert into customers(customer_id, contact_name, city, country,
company_name)
values 
('AAAAA', 'Alfred Mann', NULL, 'USA', 'fake_company'),
('BBBBB', 'Alfred Mann', NULL, 'Austria','fake_company');

SELECT contact_name, city, country
FROM customers
ORDER BY contact_name, COALESCE(city,country);

SELECT product_name, unit_price, 
CASE 
WHEN unit_price >= 100 THEN 'too expencive'
WHEN unit_price >= 50 AND unit_price < 100 THEN 'average'
WHEN unit_price < 50 THEN 'low price'
ELSE 'пошёл нахуй'
END AS price_explaining
FROM products;

SELECT contact_name, COALESCE(NULLIF(
(SELECT  CAST(COUNT(*) AS VARCHAR) FROM orders
WHERE orders.customer_id = customers.customer_id)
, '0'), 'no orders') AS order_count
FROM customers;

SELECT *
FROM employees;

SELECT last_name, first_name,
CASE WHEN title <> 'Sales Representative' THEN title
ELSE 'Sales Stuff'
END AS changed_title
FROM employees;