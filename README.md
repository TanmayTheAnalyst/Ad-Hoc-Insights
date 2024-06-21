# Ad-Hoc-Insights

## Overview
Atliq Hardwares (imaginary company) is one of the leading computer hardware producers in India and well expanded in other countries too.

However, the management noticed that they do not get enough insights to make quick and smart data-informed decisions. They want to expand their data analytics team by adding several junior data analysts. Tony Sharma, their data analytics director wanted to hire someone who is good at both tech and soft skills. Hence, he decided to conduct a SQL challenge which will help him understand both the skills.

## Task

Being a data anlayst I participated in SQL Challenge organazied by Tony Sharma. But before working on the tasks it's very important to study and understand the metadata which director has provided.
- So attached is the ‘ad-hoc-requests.pdf’ in which there are 10 ad hoc requests for which the business needs insights.
- For answering all this request I have to run them in RDBMS MySQL, or Microsoft SQL Server,etc.
- The target audience of this dashboard is top-level management - hence presentation is needed show the insights.

## Request 1

Provide the list of markets in which customer "Atliq Exclusive" operates its business in the APAC region
![Screenshot 2024-06-02 171656](https://github.com/TanmayTheAnalyst/Ad-Hoc-Insights/assets/153390240/de273d5f-b793-45a6-815d-c006cdbb5669)

![Screenshot 2024-06-09 003151](https://github.com/TanmayTheAnalyst/Ad-Hoc-Insights/assets/153390240/c7025ac6-e2ce-4c6a-9f62-938ebdd7f367)


## Request 2

What is the percentage of unique product increase in 2021 vs. 2020? The final output contains these fields,
- unique_products_2020
- unique_products_2021
- percentage_chg

![Screenshot 2024-06-02 233058](https://github.com/TanmayTheAnalyst/Ad-Hoc-Insights/assets/153390240/e1fafab0-c403-475e-8256-6c6d33d8a716)

![Screenshot 2024-06-09 195304](https://github.com/TanmayTheAnalyst/Ad-Hoc-Insights/assets/153390240/9722f95b-8e9e-49e4-a889-7c0687fc8edb)


## Request 3

Provide a report with all the unique product counts for each segment and sort them in descending order of product counts. The final output contains 2 fields,
- segment
- product_count

![Screenshot 2024-06-02 234348](https://github.com/TanmayTheAnalyst/Ad-Hoc-Insights/assets/153390240/f0b12882-bff1-4c0a-ab3e-dd92dc96d016)
![Screenshot 2024-06-09 200842](https://github.com/TanmayTheAnalyst/Ad-Hoc-Insights/assets/153390240/2e8ba6f1-2f0a-4aaa-aa2c-38fc7bd15518)


## Request 4

Follow-up: Which segment had the most increase in unique products in 2021 vs 2020? The final output contains these fields,
- segment
- product_count_2020
- product_count_2021
- difference
![Screenshot 2024-06-05 233156](https://github.com/TanmayTheAnalyst/Ad-Hoc-Insights/assets/153390240/453051b4-ca84-4087-a1a9-e8db251e756e)
![Screenshot 2024-06-09 201526](https://github.com/TanmayTheAnalyst/Ad-Hoc-Insights/assets/153390240/d6e2986f-3547-429b-949c-a83782f41ea0)

  

## Request 5

Get the products that have the highest and lowest manufacturing costs. The final output should contain these fields,
- product_code
- product
- manufacturing_cost
![Screenshot 2024-06-05 233510](https://github.com/TanmayTheAnalyst/Ad-Hoc-Insights/assets/153390240/b00530fb-5d8d-472c-8b35-d60f7accb952)
![Screenshot 2024-06-15 183512](https://github.com/TanmayTheAnalyst/Ad-Hoc-Insights/assets/153390240/310a2bb8-155e-4bad-a642-e57a63e1143b)



## Request 6

Generate a report which contains the top 5 customers who received an average high pre_invoice_discount_pct for the fiscal year 2021 and in the Indian market. The final output contains these fields,
- customer_code
- customer
- average_discount_percentage



## Request 7

Get the complete report of the Gross sales amount for the customer “Atliq Exclusive” for each month. This analysis helps to get an idea of low and high-performing months and take strategic decisions.
The final report contains these columns:
- Month
- Year
- Gross sales Amount

## Request 8

In which quarter of 2020, got the maximum total_sold_quantity? The final output contains these fields sorted by the 
- total_sold_quantity,
- Quarter
- total_sold_quantity

## Request 9

Which channel helped to bring more gross sales in the fiscal year 2021 and the percentage of contribution? The final output contains these fields,
- channel
- gross_sales_mln
- percentage

## Request 10

Get the Top 3 products in each division that have a high total_sold_quantity in the fiscal_year 2021? The final output contains these fields,
- division
- product_code
- product
- total_sold_quantity
- rank_order




