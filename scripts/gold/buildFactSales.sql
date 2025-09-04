CREATE VIEW gold.fact_sales AS
SELECT sd.sls_ord_num AS order_number
      ,pr.product_key
      ,cu.customer_key
      ,sd.sls_order_dt AS sales_date
      ,sd.sls_ship_dt AS shipping_date
      ,sd.sls_due_dt AS due_date
      ,sd.sls_sales AS sales_amount
	   ,sd.sls_quantity AS price
      ,sd.sls_price AS quantity
FROM [DataWarehouse].[silver].[crm_sales_details] sd
LEFT JOIN gold.dim_products pr
ON sd.sls_prd_key = pr.product_number
LEFT JOIN gold.dim_customers cu
ON sd.sls_cust_id = cu.customer_id

SELECT * FROM gold.fact_sales f
LEFT JOIN gold.dim_products p
ON p.product_key = f.product_key
WHERE p.product_key IS NULL






