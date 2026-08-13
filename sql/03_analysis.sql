
--What is the total revenue generated?

SELECT SUM(quantity * price) AS total_revenue FROM orders
INNER JOIN products
	ON orders.product_id = products.product_id;


--Which product category generates the most revenue?

SELECT products.category, SUM(orders.quantity * products.price) AS category_revenue FROM orders
INNER JOIN products
	ON orders.product_id = products.product_id
GROUP BY products.category
ORDER BY category_revenue DESC;


--Which cities generate the most revenue?

SELECT customers.city, SUM(orders.quantity * products.price) AS city_revenue FROM orders
INNER JOIN customers
	ON orders.customer_id = customers.customer_id
INNER JOIN products
	ON orders.product_id = products.product_id
GROUP BY customers.city
ORDER BY city_revenue DESC;


--Who are the top 10 highest spending customers?

SELECT customers.customer_id, SUM(orders.quantity * products.price) AS customer_purchase FROM orders
INNER JOIN customers
	ON orders.customer_id = customers.customer_id
INNER JOIN products
	ON orders.product_id = products.product_id
GROUP BY customers.customer_id
ORDER BY customer_purchase DESC
LIMIT 10;

--Which month has the highest sales?
SELECT EXTRACT(MONTH FROM orders.order_date) AS month_date, SUM(orders.quantity * products.price) AS month_revenue FROM orders
INNER JOIN products
	ON orders.product_id = products.product_id
GROUP BY month_date
ORDER BY month_revenue DESC;

--What is the average spending per customer?
-- This is tricky, since I think we need to perform two levels of aggregation.

SELECT AVG(customer_totals.customer_purchase) AS avg_customer_purchase FROM (
	SELECT orders.customer_id,
	SUM(orders.quantity * products.price) AS customer_purchase 
	FROM orders
	INNER JOIN products
		ON orders.product_id = products.product_id
	GROUP BY orders.customer_id
	) AS customer_totals;
-- The subquery doesn't actually need a name, but it
-- helps readability.

	




