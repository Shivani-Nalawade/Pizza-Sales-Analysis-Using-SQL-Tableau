--KPI'S
--1. Total Revenue:  
SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales

--2. Average Order Value: 
SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_Order_Value FROM pizza_sales

--3. Total Pizzas Sold:
SELECT SUM(quantity) AS Total_Pizzas_Sold FROM pizza_sales

--4. Total Orders:
SELECT COUNT(DISTINCT order_id) AS Total_orders FROM pizza_sales

--5. Average Pizzas Per Order:
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Average_pizzas_per_order 
FROM pizza_sales

--Charts Requirement
--Hourly Trend for Total Pizzas Sold:
SELECT DATEPART(HOUR, order_time) AS Order_hour, SUM(quantity) AS Total_pizzas_sold FROM pizza_sales 
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time)

--Weekly Trend for Total Orders:
SELECT DATEPART(ISO_WEEK, order_date) AS Week_number, YEAR(order_date) AS Order_year, COUNT(DISTINCT order_id) AS Total_orders FROM pizza_sales
GROUP BY DATEPART(ISO_WEEK, order_date), YEAR(order_date) 
ORDER BY DATEPART(ISO_WEEK, order_date), YEAR(order_date) 

--Percentage of Sales by Pizza Category:
SELECT pizza_category, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS PCT
FROM pizza_sales 
GROUP BY pizza_category

--Percentage of Sales by Pizza Size:
SELECT pizza_size, CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales 
GROUP BY pizza_size
ORDER BY PCT 

--Total Pizzas Sold by Pizza Category

SELECT pizza_category, SUM(quantity) AS Total_Quantity_Sold
FROM pizza_sales
-- WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

--Top 5 best sellers by Revenue, Total Quantity and Total Orders:
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

--Bottom 5 best sellers by Revenue, Total Quantity and Total Orders:
SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue 

--Top 5 best sellers by Total Quantity:
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC

--Bottom 5 best sellers by Total Quantity:
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity 

--Top 5 best sellers by Total Orders:
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC

--Bottom 5 best sellers by Total Orders:
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders

