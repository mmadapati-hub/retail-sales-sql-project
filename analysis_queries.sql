--Customer by Revenue
SELECT c.customer_name,
       SUM(o.quantity * p.price) AS total_spent
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
JOIN products p ON o.product_id = p.product_id
GROUP BY c.customer_name;


--Total Revenue--
SELECT 
    SUM(o.quantity * p.price) AS total_revenue
FROM orders o
JOIN products p 
    ON o.product_id = p.product_id;


--Top 5 Customers by Revenue
SELECT 
    c.customer_name,
    SUM(o.quantity * p.price) AS total_spent
FROM orders o
JOIN customers c 
    ON o.customer_id = c.customer_id
JOIN products p 
    ON o.product_id = p.product_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 5;

--Top 5 Products by Sales
SELECT 
    p.product_name,
    SUM(o.quantity) AS total_units_sold
FROM orders o
JOIN products p 
    ON o.product_id = p.product_id
GROUP BY p.product_name
ORDER BY total_units_sold DESC
LIMIT 5;

--Monthly Sales Trend
SELECT 
    DATE_TRUNC('month', o.order_date) AS month,
    SUM(o.quantity * p.price) AS monthly_revenue
FROM orders o
JOIN products p 
    ON o.product_id = p.product_id
GROUP BY DATE_TRUNC('month', o.order_date)
ORDER BY month;

--Category-wise Revenue
SELECT 
    p.category,
    SUM(o.quantity * p.price) AS total_revenue
FROM orders o
JOIN products p 
    ON o.product_id = p.product_id
GROUP BY p.category
ORDER BY total_revenue DESC;
