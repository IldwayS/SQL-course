SELECT customers.contact_name, order_id
FROM orders
RIGHT JOIN customers USING (customer_id)
WHERE order_id is NULL