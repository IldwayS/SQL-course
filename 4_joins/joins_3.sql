SELECT customers.contact_name, order_id
FROM customers
LEFT JOIN orders USING (customer_id)
WHERE order_id is NULL