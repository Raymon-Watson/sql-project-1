-- ########################
-- Exploration of data
-- ########################


-- ###################
-- 1. Table inspection:
-- ###################


-- Head of each table:
SELECT * FROM products
LIMIT 5;
-- Note that each product has an int associated with it.
-- However, each product with the same name but a different
-- integer value has a different price, meaning they are
-- distinct products.

-- Basic questions:
-- What is the total number of products?
-- Which category has the most products?
-- What is the spread of prices?


SELECT * FROM customers
LIMIT 5;

-- Basic questions:
-- Do more females or males order products?
-- Are loyalty members more frequent purchasers?
-- What is the spread of ages?
-- What city has the most orders?

SELECT * FROM orders
LIMIT 5;

-- Basic questions:
-- What is the most common payment method?
-- What is the spread of order quantities?
-- what is the most commonly purchased item?
-- What are the statistics of customers purchasing items?






-- ##################
--2. Basic questions
-- ##################

-- #### 2.a. PRODUCTS ####


-- Total number of products: 80
SELECT COUNT(*) FROM products;


-- Which category has the most products?
SELECT Category, COUNT(*) AS category_count FROM products
GROUP BY Category
ORDER BY category_count DESC;
-- Most products: Sports (21) / Home (21)
-- Least products: Beauty (10)


-- What is the spread of prices?
SELECT AVG(price) AS avg_price FROM products;

-- Most expensive 5 items:
SELECT product_name, price FROM products
ORDER BY price DESC
LIMIT 5;

-- Cheapest 5 items:
SELECT product_name, price FROM products
ORDER BY price ASC
LIMIT 5;

-- #### 2.b. CUSTOMERS ####


-- Total number of customers: 1200
SELECT COUNT(*) FROM customers;


-- Do more females or males order products?
SELECT gender, COUNT(*) FROM customers
GROUP BY gender;
-- Males slightly more than females.


-- Are loyalty members more frequent purchasers?
SELECT loyalty_member, COUNT(*) FROM customers
GROUP BY loyalty_member;
-- More non-loyalty members, but not by much.


-- What is the spread of ages?
SELECT AVG(age) FROM customers;
-- Average age: 41.62


-- What city has the most orders?
SELECT City, COUNT(*) AS City_count FROM customers
GROUP BY City
ORDER BY City_count DESC;
-- Highest: Sheffield (163)
-- Lowest: Manchester (133)
-- Fairly small spread.



-- #### 2.c. ORDERS ####


-- Total number of orders: 4000
SELECT COUNT(*) FROM orders;


-- What is the most common payment method?
SELECT payment_method, COUNT(payment_method) AS count_payment_method FROM orders
GROUP BY payment_method
ORDER BY count_payment_method DESC;
-- Each payment method used roughly the same amount of times.


-- What is the spread of order quantities?
SELECT AVG(quantity), MIN(quantity), MAX(quantity) FROM orders;
-- Average of nearly 3 items per order seems high.


-- what is the most and least commonly purchased item?
-- MOST:
SELECT product_name, SUM(quantity) AS num_purchases FROM orders
INNER JOIN products
	ON orders.product_id = products.product_id
GROUP BY product_name
ORDER BY num_purchases DESC
LIMIT 5;

-- LEAST:
SELECT product_name, SUM(quantity) AS num_purchases FROM orders
INNER JOIN products
	ON orders.product_id = products.product_id
GROUP BY product_name
ORDER BY num_purchases ASC
LIMIT 5;


-- What are the statistics of customers purchasing items?
SELECT customer_id, COUNT(*) AS num_purchases FROM orders
GROUP BY customer_id
ORDER BY num_purchases DESC
LIMIT 5;
-- Note that we don't have customer names.
-- Probably should account for multiple purchases
-- of the same item.
SELECT customer_id, SUM(quantity) AS total_purchases FROM orders
GROUP BY customer_id
ORDER BY total_purchases DESC
LIMIT 5;




