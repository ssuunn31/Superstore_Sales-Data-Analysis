CREATE TABLE superstore_data
(
row_id int8,
order_id varchar(50),
order_date date,
ship_date date,
ship_mode varchar(50),
customer_id varchar(50),
customer_name varchar(50),
segment varchar(50),
country varchar(50),
city varchar(50),
state varchar(50),
postal_code int8,
region varchar(50),
product_id varchar(50),
category varchar(50),
sub_category varchar(50),
product_name varchar(150),
sales double,
quantity int,
discount double,
profit double
)

SELECT * FROM superstore_data;

SELECT * FROM cleaned_data;

DROP TABLE superstore_data;

Total Sales and Total Profit per Category
SELECT category,CAST(SUM(sales) AS SIGNED) AS Total_Sales, CAST(SUM(profit) AS SIGNED) AS Total_Profit
FROM superstore_data
GROUP BY category

Total Sales and Total Profit by Sub-Category
SELECT sub_category, CAST(SUM(sales) AS SIGNED) AS Total_Sales, CAST(SUM(profit) AS SIGNED) AS Total_Profit
FROM superstore_data
GROUP BY sub_category

Top 5 Most Profitable Products
SELECT product_name, CAST(SUM(profit) AS SIGNED) AS Total_Profit
FROM superstore_data
GROUP BY product_name
ORDER BY Total_Profit DESC
LIMIT 5

Bottom 5 most unprofitable products
SELECT product_name, CAST(SUM(profit) AS SIGNED) AS Total_Profit
FROM superstore_data
GROUP BY product_name
ORDER BY Total_Profit ASC
LIMIT 5

5 Best Selling Products
SELECT product_name, CAST(SUM(sales) AS SIGNED) AS Total_Sales
FROM superstore_data
GROUP BY product_name
ORDER BY Total_Sales DESC
LIMIT 5

5 Worst Selling Products
SELECT product_name, CAST(SUM(sales) AS SIGNED) AS Total_Sales
FROM superstore_data
GROUP BY product_name
ORDER BY Total_Sales
LIMIT 5

SELECT * FROM superstore_data

Best Selling & Most Profitable Region
SELECT region, CAST(SUM(sales) AS SIGNED) AS Total_Sales, CAST(SUM(profit) AS SIGNED) AS Total_profit
FROM superstore_data
GROUP BY region
ORDER BY Total_Sales
LIMIT 5

SELECT region, CAST(SUM(sales) AS SIGNED) AS Total_Sales, CAST(SUM(profit) AS SIGNED) AS Total_profit
FROM superstore_data
GROUP BY region
ORDER BY Total_Profit
LIMIT 5

Which ship_mode is most preferred?
SELECT ship_mode, COUNT(ship_mode)
FROM superstore_data
GROUP BY ship_mode
ORDER BY COUNT(ship_mode) DESC

Analysis by Segment
SELECT segment, CAST(SUM(sales) AS SIGNED) AS total_sales, CAST(SUM(profit) AS SIGNED) AS total_profit
FROM superstore_data
GROUP BY segment

Which city has the highest number of sales?
SELECT city, CAST(SUM(sales) AS SIGNED) AS total_sales
FROM superstore_data
GROUP BY city
ORDER BY total_sales DESC
