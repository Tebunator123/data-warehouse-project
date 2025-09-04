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
SELECT 
MIN(birthdate) as oldest_birthday, 
DATEDIFF(year, MIN(birthdate), GETDATE()) as olderst_age,
MAX(birthdate) as youngest_birthdate,
DATEDIFF(year, MAX(birthdate), GETDATE()) as youngest_age
FROM gold.dim_customers


/*SELECT * FROM gold.dim_customers
WHERE first_name = 'Aaron' */