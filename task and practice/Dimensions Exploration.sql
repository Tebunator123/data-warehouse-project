-- Explore ALl Countrires our customers, Categories come from.

--SELECT country FROM gold.dim_customers

--SELECT DISTINCT category, subcategory, product_name FROM gold.dim_products
--ORDER BY 1,2,3

--Date Exploration

/*SELECT sl.customer_key, cu.first_name,   
MIN(sl.sales_date) AS first_order_date, MAX(sl.shipping_date) AS last_order_date, 
DATEDIFF(MONTH, MIN(sales_date), MAX(sales_date)) AS order_range_years
FROM gold.fact_sales sl
LEFT JOIN gold.dim_customers cu
ON sl.customer_key = cu.customer_key
GROUP BY sl.customer_key, cu.first_name
*/

--Find the youngest and the older customer
/*SELECT 
MIN(birthdate) as oldest_birthday, 
DATEDIFF(year, MIN(birthdate), GETDATE()) as olderst_age,
MAX(birthdate) as youngest_birthdate,
DATEDIFF(year, MAX(birthdate), GETDATE()) as youngest_age
FROM gold.dim_customers
/*SELECT * FROM gold.dim_customers*/
WHERE first_name = 'Aaron' */

-- Masure Exploration
--Find Total Sales
SELECT SUM(sales_amount) as total_sales FROM gold.fact_sales

--Find how many items are sold
SELECT SUM(price) as items_sold FROM gold.fact_sales

--Find the average selling price
SELECT avg(quantity) as average_price FROM gold.fact_sales

--Find the Total number Orders. We use DISTINCT to eliminate repearting orders
SELECT count(DISTINCT order_number) as total_order FROM gold.fact_sales

--Find the total number of Products
SELECT count(product_key) as total_products FROM gold.dim_products

--Find the total number of customers
SELECT count(customer_key) as total_customers FROM gold.dim_customers

--Find the total number of customers that has placed an order - repeating Customers
SELECT count(DISTINCT customer_key) as customers_ordered FROM gold.fact_sales


--Find the total number of customers that has placed an order - repeating Customers because of ClAUSE DISTINCT
SELECT count(DISTINCT customer_key) as total_customers FROM gold.dim_customers

PRINT '>> the total number of customers that has placed an order - Customers because no DISTINCT CLAUSE'
SELECT count(DISTINCT customer_key) as customers_ordered FROM gold.fact_sales

-- Generate a Report that shows all key metrics of the business
SELECT 'Total Sales' as measure_name, SUM(sales_amount) as measuere_value FROM gold.fact_sales
UNION ALL
SELECT 'Total Quantity' as measure_name, SUM(price) as measuere_value FROM gold.fact_sales
UNION ALL
SELECT 'Average Price' as measure_name, AVG(quantity) as measuere_value FROM gold.fact_sales
UNION ALL
SELECT 'Total No. Orders' as measure_name, COUNT(DISTINCT order_number) as measuere_value FROM gold.fact_sales
UNION ALL
SELECT 'TOtal No. Products' as measure_name, COUNT(product_name) as measuere_value FROM gold.dim_products
UNION ALL
SELECT 'Total No. Customers' as measure_name, COUNT(customer_key) as measuere_value FROM gold.dim_customers













