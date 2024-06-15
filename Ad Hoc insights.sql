# REQUEST 1

-- Provide the list of markets in which customer "Atliq Exclusive" operates its business in the APAC region

SELECT distinct market FROM dim_customer
WHERE customer = "Atliq Exclusive" AND
region = "APAC";

# REQUEST 2
-- What is the percentage of unique product increase in 2021 vs. 2020?
WITH CTE1 AS (
SELECT 
COUNT(DISTINCT(case when fiscal_year = 2020 then product_code end)) AS unique_products_2020,
COUNT(DISTINCT(case when fiscal_year = 2021 then product_code end)) AS unique_products_2021
FROM fact_sales_monthly)
SELECT
unique_products_2020,
unique_products_2021,
ROUND((unique_products_2021-unique_products_2020) * 100/ unique_products_2020,2) as pct_change
FROM cte1;




# REQUEST 3
-- Provide a report with all the unique product counts for each segment and sort them in descending order of product counts.
SELECT segment,
COUNT(DISTINCT product_code) AS product_count
 FROM dim_product
 GROUP BY segment
 ORDER BY product_count DESC;
 
 # REQUEST 4
 -- Follow-up: Which segment had the most increase in unique products in 2021 vs 2020? 
 WITH cte1 AS(
SELECT
segment,
COUNT(DISTINCT(CASE WHEN fiscal_year = 2020 THEN s.product_code END)) AS unique_products_2020,
COUNT(DISTINCT(CASE WHEN fiscal_year = 2021 THEN s.product_code END)) AS unique_products_2021
FROM dim_product p 
JOIN fact_sales_monthly s
ON p.product_code = s.product_code
GROUP BY segment)
SELECT 
segment, unique_products_2020,
unique_products_2021,
unique_products_2021-unique_products_2020 AS difference
FROM cte1
ORDER BY difference DESC;

# REQUEST 5 
 -- Get the products that have the highest and lowest manufacturing costs.

(SELECT
p.product_code,p.product, manufacturing_cost
FROM dim_product p
JOIN fact_manufacturing_cost m
ON p.product_code = m.product_code
ORDER BY manufacturing_cost DESC
LIMIT 1) UNION
(SELECT
p.product_code,p.product, manufacturing_cost
FROM dim_product p
JOIN fact_manufacturing_cost m
ON p.product_code = m.product_code
ORDER BY manufacturing_cost ASC
LIMIT 1);


# REQUEST 6 
-- Generate a report which contains the top 5 customers who received an 
-- average high pre_invoice_discount_pct  for the fiscal year 2021 and in the Indian market
SELECT
c.customer_code,c.customer,
ROUND(AVG(pre_invoice_discount_pct)*100,2)  AS  discount_pct
FROM dim_customer c
JOIN fact_pre_invoice_deductions d
ON c.customer_code = d.customer_code
WHERE fiscal_year = 2021 AND market = "India"
GROUP BY customer_code,customer
ORDER BY pre_invoice_discount_pct DESC
LIMIT 5;

# REQUEST 7
-- Get the complete report of the Gross sales amount for the customer “Atliq  Exclusive” for each month. 
-- This analysis helps to get an idea of low and high-performing months and take strategic decisions
SELECT
DATE_FORMAT(date, '%Y-%m')as Months,s.fiscal_year,
ROUND((SUM(gross_price*sold_quantity)/1000000),2) as gross_sales_amount_mln
FROM dim_customer c
JOIN fact_sales_monthly s
ON c.customer_code = s.customer_code
JOIN fact_gross_price p
ON s.product_code = p.product_code
WHERE customer = "Atliq Exclusive"
GROUP BY s.fiscal_year,months
ORDER BY months;

# REQUEST 8
-- In which quarter of 2020, got the maximum total_sold_quantity? The final
-- output contains these fields sorted by the total_sold_quantity,
-- Quarter, total_sold_quantity

SELECT
(CASE 
WHEN MONTH(date) IN (9,10,11) THEN "Q1"
WHEN MONTH(date) IN (12,1,2) THEN "Q2"
WHEN MONTH(date) IN (3,4,5) THEN "Q3"
WHEN MONTH(date) IN (6,7,8) THEN "Q4"
END) AS "Quarter_result",
SUM(sold_quantity) AS sold_quantity
FROM fact_sales_monthly s
WHERE fiscal_year = 2020
GROUP BY quarter_result
ORDER BY sold_quantity DESC;
# REQUEST 9
-- Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution?

WITH cte1 AS (
SELECT
c.channel,
round(sum(sold_quantity*gross_price)/1000000,2) as gross_sales_mln
FROM dim_customer c
JOIN fact_sales_monthly s 
ON c.customer_code = s.customer_code
JOIN fact_gross_price g
ON s.product_code = g.product_code
WHERE s.fiscal_year = 2021
GROUP BY channel)
SELECT  channel, gross_sales_mln,
round(gross_sales_mln * 100 / (SELECT sum(gross_sales_mln) FROM cte1),2) AS pct_contribution
FROM cte1
GROUP BY channel;


# REQUEST 10
-- Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021? 

WITH cte1 AS (
SELECT
c.product_code, division, concat(product, ' ' ,variant) as product_variant, sum(sold_quantity) AS total_sold_quantity, 
DENSE_RANK() OVER ( PARTITION BY division ORDER BY sum(sold_quantity) DESC) AS rank_order
FROM dim_product c
JOIN fact_sales_monthly s 
ON c.product_code = s.product_code
WHERE fiscal_year = 2021
GROUP BY division,product_code)
SELECT * FROM cte1 
WHERE rank_order < 4 