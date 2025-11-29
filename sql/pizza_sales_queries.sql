------------------------------------------------------------
-- Pizza Sales Analysis - True North Pizzeria
-- SQL Validation and Analysis Queries
-- File: pizza_sales_queries.sql
------------------------------------------------------------

------------------------------------------------------------
-- Section A: KPI Queries
------------------------------------------------------------

-- 1. Total Revenue

SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales;

-- 2. Average Order Value

SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_Order_Value FROM pizza_sales;

-- 3. Total Pizzas Sold

SELECT SUM(quantity) AS Total_Pizzas_Sold FROM pizza_sales; 

-- 4. Total Orders

SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;

-- 5. Average Pizzas Per Order

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) /
CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_Pizzas_per_order FROM pizza_sales;


------------------------------------------------------------
-- Section B: Time-Based Analysis
------------------------------------------------------------

-- 1. Daily Trend for Total Orders

SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME(DW, order_date);

-- 2. Monthly Trend for Total Orders

SELECT DATENAME(MONTH, order_date) AS Month_Name, COUNT(DISTINCT order_id) AS Total_orders
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY Total_orders DESC;


------------------------------------------------------------
-- Section C: Category and Size Performance
------------------------------------------------------------

-- 1. Percentage of Sales by Pizza Category (full year)

SELECT pizza_category, SUM(total_price) AS Total_Sales, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS PCT
FROM pizza_sales
GROUP BY pizza_category;

-- 1a. Percentage of Sales by Pizza Category (January only)

SELECT pizza_category, SUM(total_price) AS Total_Sales, SUM(total_price) * 100 / (SELECT SUM(total_price) 
FROM pizza_sales WHERE MONTH(order_date) = 1) AS PCT
FROM pizza_sales
WHERE MONTH(order_date) = 1
GROUP BY pizza_category;

-- 2. Percentage of Sales by Pizza Size

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10, 2)) AS Total_Sales, CAST(SUM(total_price) * 100 / 
(SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10, 2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY PCT DESC;

-- 3. Total Sales by Pizza Category

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10, 2)) AS Total_Price
FROM pizza_sales
GROUP BY pizza_category;


------------------------------------------------------------
-- Section D: Top 5 and Bottom 5 Pizza Performance
------------------------------------------------------------

-- 1. Top 5 Best Sellers by Revenue

SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC;

-- 2. Top 5 Best Sellers by Quantity

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC;

-- 3. Top 5 Best Sellers by Total Orders

SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC;

-- 4. Bottom 5 Worst Sellers by Revenue

SELECT TOP 5 pizza_name, SUM(total_price) as Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue;

-- 5. Bottom 5 Worst Sellers by Quantity

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity;


-- 6. Bottom 5 Worst Sellers by Total Orders

SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders;


------------------------------------------------------------
-- Section E: Helper Query
------------------------------------------------------------

-- Quick preview of the raw table

SELECT TOP 100 *
FROM pizza_sales;



