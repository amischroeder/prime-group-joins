-- 1. Get all customers and their addresses.
SELECT * FROM customers 
JOIN addresses ON customers.id = addresses.customer_id;

-- 2. Get all orders and their line items.
SELECT * FROM orders
JOIN line_items ON orders.id = line_items.order_id;

-- 3. Which warehouses have cheetos?
SELECT * FROM warehouse
JOIN warehouse_product 
ON warehouse.id=warehouse_product.warehouse_id
JOIN products 
ON products.id=warehouse_product.product_id
where description='cheetos';

Answer= delta
-- 4. Which warehouses have diet pepsi?
SELECT * FROM warehouse
JOIN warehouse_product 
ON warehouse.id=warehouse_product.warehouse_id
JOIN products 
ON products.id=warehouse_product.product_id
where description='diet pepsi';

Answer = alpha, delta, gamma

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT customers.id, first_name, last_name, COUNT(*) 
FROM orders
JOIN addresses
ON orders.address_id=addresses.id
JOIN customers
ON addresses.customer_id=customers.id
GROUP BY customers.id;

Answer = Lisa had 3, Lucy had 3, Charles had 1, Geroge had 0

-- 6. How many customers do we have?
SELECT COUNT(*)
FROM customers;

Answer  = 4

-- 7. How many products do we carry?
SELECT COUNT(*)
FROM products;

Answer = 7
-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT SUM(on_hand)
FROM products
JOIN warehouse_product
ON products.id=warehouse_product.product_id
WHERE id =6;

Answer=92