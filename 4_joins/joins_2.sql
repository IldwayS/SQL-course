SELECT product_name, units_in_stock, suppliers.contact_name, suppliers.phone
FROM products
JOIN suppliers USING (supplier_id)
JOIN categories USING (category_id)
WHERE category_name IN ('Beaverages', 'Seafood') AND discontinued <> 1 AND units_in_stock < 20