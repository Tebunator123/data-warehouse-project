-- Which 5 Products generate the highest revenue?

SELECT TOP 5
p.product_name,
SUM(s.sales_amount) as total_revenue
FROM gold.fact_sales s
LEFT JOIN gold.dim_products p
ON p.product_key = s.product_key
GROUP BY p.product_name
ORDER BY total_revenue DESC

-- Which 5 worst-performing products in items of sales?

SELECT TOP 5
p.product_name,
SUM(s.sales_amount) as total_revenue
FROM gold.fact_sales s
LEFT JOIN gold.dim_products p
ON p.product_key = s.product_key
GROUP BY p.product_name
ORDER BY total_revenue 

-- Window Function to get top five performing products
SELECT * FROM (SELECT
p.product_name,
SUM(s.sales_amount) as total_revenue,
RANK() OVER (ORDER BY SUM(s.sales_amount) DESC) as rank_products
FROM gold.fact_sales s
LEFT JOIN gold.dim_products p
ON p.product_key = s.product_key
GROUP BY p.product_name) t
WHERE rank_products <= 5

-- Find the top 10 customers who have generated the highest reveue
SELECT TOP 10
c.customer_key,
c.first_name,
c.last_name,
SUM(s.sales_amount) as total_revenue
FROM gold.fact_sales s
LEFT JOIN gold.dim_customers c
ON c.customer_key = s.customer_key
GROUP BY c.customer_key,
c.first_name,
c.last_name
ORDER BY total_revenue DESC

-- Find the 3 customers wit the fewest orders placed
SELECT TOP 3
c.customer_key,
c.first_name,
c.last_name,
COUNT(DISTINCT order_number) as total_orders
FROM gold.fact_sales s
LEFT JOIN gold.dim_customers c
ON c.customer_key = s.customer_key
GROUP BY 
c.customer_key,
c.first_name,
c.last_name
ORDER BY total_orders