SELECT SUM( units_in_stock * unit_price)
FROM products
WHERE discontinued = 0
