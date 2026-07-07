# Creating Database
create database online_sales;
use online_sales;
show Tables;
select * from orders limit 5;
# Using EXTRACT(MONTH FROM order_Date) for month

SELECT
EXTRACT(YEAR FROM STR_TO_DATE(`Order Date`, '%d-%b-%y')) AS Year,
EXTRACT(MONTH FROM STR_TO_DATE(`Order Date`, '%d-%b-%y')) AS Month,
ROUND(SUM(Sales),2) AS Revenue,
COUNT(DISTINCT `Order ID`) AS Order_Volume
FROM orders
GROUP BY
EXTRACT(YEAR FROM STR_TO_DATE(`Order Date`, '%d-%b-%y')),
EXTRACT(MONTH FROM STR_TO_DATE(`Order Date`, '%d-%b-%y'))
ORDER BY Year, Month;

-- Monthly revenue and order volume for year 2017
SELECT
YEAR(STR_TO_DATE(`Order Date`, '%d-%b-%y')) AS Year,
MONTH(STR_TO_DATE(`Order Date`, '%d-%b-%y')) AS Month,
ROUND(SUM(Sales),2) AS Revenue,
COUNT(DISTINCT `Order ID`) AS Order_Volume
FROM orders
WHERE YEAR(STR_TO_DATE(`Order Date`, '%d-%b-%y')) = 2017
GROUP BY Year, Month
ORDER BY Month;

-- Top 3 months by revenue
SELECT
YEAR(STR_TO_DATE(`Order Date`, '%d-%b-%y')) AS Year,
MONTH(STR_TO_DATE(`Order Date`, '%d-%b-%y')) AS Month,
ROUND(SUM(Sales),2) AS Revenue
FROM orders
GROUP BY Year, Month
ORDER BY Revenue DESC
LIMIT 3;
