CREATE DATABASE pizza_sales;
use pizza_sales;
SELECT * FROM pizza_sales;
describe pizza_sales;
UPDATE pizza_sales
SET order_date = STR_TO_DATE(order_date, '%d-%m-%Y');

alter table pizza_sales
modify column order_date date; 

UPDATE pizza_sales
SET order_time = TIME(STR_TO_DATE(order_time, '%H:%i:%s'));

alter table pizza_sales
modify column order_time time;

SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;

SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Average_Order_Value 
FROM pizza_sales;

SELECT SUM(quantity) AS Total_Pizza_Sold 
FROM pizza_sales;

SELECT COUNT(DISTINCT order_id) AS Total_Orders 
FROM pizza_sales;

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) /
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS
Avg_Pizzas_Per_Order FROM pizza_sales;

SELECT DAYNAME(order_date) AS order_day, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DAYNAME(order_date);

SELECT MONTHNAME(order_date) AS Month_Name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY MONTHNAME(order_date)
ORDER BY Total_Orders DESC;

SELECT 
    pizza_category, 
    SUM(total_price) AS Total_Sales,
    SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS Total_Sales_Percentage
FROM 
    pizza_sales 
GROUP BY 
    pizza_category;

SELECT 
    pizza_size, 
    SUM(total_price) AS Total_Sales,
    SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS Total_Sales_Percentage
FROM 
    pizza_sales 
GROUP BY 
    pizza_size;
    
SELECT 
    pizza_category, 
    SUM(quantity) AS Total_Quantity_Sold 
FROM 
    pizza_sales
GROUP BY 
    pizza_category
ORDER BY 
    Total_Quantity_Sold DESC;
    
    SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5;

SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5;

SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC
LIMIT 5;

SELECT pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC
LIMIT 5;

SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC
LIMIT 5;

SELECT pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC
LIMIT 5;








