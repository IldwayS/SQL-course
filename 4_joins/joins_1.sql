SELECT customers.company_name, CONCAT(last_name, ' ', first_name) as emp_name
FROM customers
JOIN orders USING (customer_id)
JOIN employees USING (employee_id)
JOIN shippers ON shippers.shipper_id = orders.ship_via
WHERE customers.city = 'London' AND employees.city = 'London' AND shippers.company_name = 'Speedy Express'
