CREATE VIEW abc AS
SELECT order_date, required_date, 
shipped_date, ship_postal_code,
company_name, contact_name, phone, 
last_name, first_name, title
FROM orders
JOIN customers USING (customer_id)
JOIN employees USING (employee_id);

SELECT *
FROM abc
WHERE order_date > '01.01.1997';

ALTER VIEW abc RENAME TO abc_old;

CREATE VIEW abc AS
SELECT order_date, required_date,
shipped_date, ship_postal_code, 
ship_country, company_name, contact_name,
phone, last_name, first_name, title
FROM orders
JOIN customers USING (customer_id)
JOIN employees USING (employee_id);

CREATE OR REPLACE VIEW abc AS
SELECT order_date, required_date,
shipped_date, ship_postal_code, 
ship_country, company_name, contact_name,
phone, last_name, first_name, title, reports_to
FROM orders
JOIN customers USING (customer_id)
JOIN employees USING (employee_id);

DROP VIEW IF EXISTS abc;
ALTER VIEW abc RENAME TO abc_old_2;

CREATE OR REPLACE VIEW abc AS
SELECT order_date, required_date,
shipped_date, ship_postal_code, 
ship_country, company_name, contact_name,
phone, last_name, first_name, title,
ship_country, postal_code, reports_to
FROM orders
JOIN customers USING (customer_id)
JOIN employees USING (employee_id);

CREATE VIEW active_products AS
SELECT * FROM products
WHERE discontinued = 0
WITH LOCAL CHECK OPTION;
