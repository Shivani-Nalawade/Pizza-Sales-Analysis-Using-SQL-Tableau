# Pizza-Sales-Analysis-Using-SQL-Tableau

## Problem Statement

### KPI’s REQUIREMENT
We need to analyze key indicators for our pizza sales data to gain insights into our business performance. Specifically, we want to calculate the following metrics:

1. Total Revenue: The sum of the total price of all pizza orders.

2. Average Order Value: The average amount spent per order, calculated by dividing the total revenue by the total number of orders.

3. Total Pizzas Sold: The sum of the quantities of all pizzas sold.

4. Total Orders: The total number of orders placed.

5. Average Pizzas Per Order: The average number of pizzas sold per order, calculated by dividing the total number of pizzas sold by the total number of orders.

### CHARTS REQUIREMENT
We would like to visualize various aspects of our pizza sales data to gain insights and understand key trends. We have identified the following requirements for creating charts:

1. Hourly Trend for Total Pizzas Sold: Create a stacked bar chart that displays the hourly trend of total orders over a specific time period. This chart will help us identify any patterns or fluctuations in order volumes on a hourly basis.

2. Weekly Trend for Total Orders: Create a line chart that illustrates the weekly trend of total orders throughout the year. This chart will allow us to identify peak weeks or periods of high order activity.

3. Percentage of Sales by Pizza Category: Create a pie chart that shows the distribution of sales across different pizza categories. This chart will provide insights into the popularity of various pizza categories and their contribution to overall sales.

4. Percentage of Sales by Pizza Size: Generate a pie chart that represents the percentage of sales attributed to different pizza sizes. This chart will help us understand customer preferences for pizza sizes and their impact on sales.

5. Total Pizzas Sold by Pizza Category: Create a funnel chart that presents the total number of pizzas sold for each pizza category. This chart will allow us to compare the sales performance of different pizza categories.

6. Top 5 Best Sellers by Revenue, Total Quantity and Total Orders: Create a bar chart highlighting the top 5 best-selling pizzas based on the Revenue, Total Quantity, Total Orders. This chart will help us identify the most popular pizza options.

7. Bottom 5 Best Sellers by Revenue, Total Quantity and Total Orders: Create a bar chart showcasing the bottom 5 worst-selling pizzas based on the Revenue, Total Quantity, Total Orders. This chart will enable us to identify underperforming or less popular pizza options.

### ANALYSIS OF DIFFERENT SQL STATEMENT ON DATA BASE

#### A. KPI’s

##### 1.Total Revenue:

SELECT SUM(total_price) AS Total_Revenue FROM pizza_sales

##### 2.Average Order Value:

SELECT SUM(total_price) / COUNT(DISTINCT order_id) AS Avg_Order_Value FROM pizza_sales

##### 3.Total Pizza Sold:

SELECT SUM(quantity) AS Total_Pizzas_Sold FROM pizza_sales

##### 4.Total Orders:

SELECT COUNT(DISTINCT order_id) AS Total_orders FROM pizza_sales

##### 5.Average Pizzas Per Order:

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Average_pizzas_per_order 
FROM pizza_sales

#### B. Hourly Trend for Total Pizzas Sold

SELECT DATEPART(HOUR, order_time) AS Order_hour, SUM(quantity) AS Total_pizzas_sold FROM pizza_sales 
GROUP BY DATEPART(HOUR, order_time)
ORDER BY DATEPART(HOUR, order_time)

#### C. Weekly Trend for Orders

SELECT DATEPART(ISO_WEEK, order_date) AS Week_number, YEAR(order_date) AS Order_year, COUNT(DISTINCT order_id) AS Total_orders FROM pizza_sales
GROUP BY DATEPART(ISO_WEEK, order_date), YEAR(order_date) 
ORDER BY DATEPART(ISO_WEEK, order_date), YEAR(order_date) 

#### D. % of Sales by Pizza Category

SELECT pizza_category, SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS PCT
FROM pizza_sales 
GROUP BY pizza_category

#### E. % of Sales by Pizza Size

SELECT pizza_size, CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) FROM pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales 
GROUP BY pizza_size
ORDER BY PCT 

#### F. Total Pizzas Sold by Pizza Category

SELECT pizza_category, SUM(quantity) AS Total_Quantity_Sold
FROM pizza_sales
-- WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

#### G. Top 5 Pizzas by Revenue

SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

#### H. Bottom 5 Pizzas by Revenue

SELECT TOP 5 pizza_name, SUM(total_price) AS Total_Revenue FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue

#### I. Top 5 Pizzas by Quantity

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC

#### J. Bottom 5 Pizzas by Total Quantity:
SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Quantity FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity 

#### K. Top 5 Pizzas by Total Orders

SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC

#### L. Bottom 5 Pizzas by Total Orders
SELECT TOP 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders

### Data Cleaning
Pizza size category we have in our database is abbreviated and for dashboard we need it in full expanded form. For eg. L= large, M= medium etc, so we will create an alias to temporary change its name in required format.

![image](https://github.com/user-attachments/assets/1434e8bc-e11a-4c47-a6ab-30d490e93c98)


## Build Dashboard or a Report using Tableau

Created a comprehensive dashboard in Tableau featuring key metrics and charts, including Hourly Trend, Weekly Trend, Sales by Category, Sales by Size, Total Pizzas Sold by Category, Top 5 Best Sellers, and Bottom 5 Worst Sellers.

### KPI’S

- Total Revenue SUM([order id])

- Total Orders COUNTD([order id])

- Average Order Value [total revenue] / [total orders]

- Total Pizzas Sold SUM([quantity])

- Average Pizzas Per Order [total pizzas sold] / [total orders]

![image](https://github.com/user-attachments/assets/3216695e-b453-4413-b8a9-0ace6c8edbd4)

### KEY INSIGHTS

![image](https://github.com/user-attachments/assets/948ac30b-e711-44fa-9067-f44a21a4703e) ![image](https://github.com/user-attachments/assets/e89daad4-a02c-4874-9f6d-bfa9c0cab405)

![image](https://github.com/user-attachments/assets/36dbbcd2-1cd7-4962-8a48-e444cbf293a9) ![image](https://github.com/user-attachments/assets/3699e399-9fe6-4655-9ba8-67055814470a)

## DASHBOARDS

![image](https://github.com/user-attachments/assets/7d0705a4-edcb-4fc3-8749-9697b3c68d9e)

![image](https://github.com/user-attachments/assets/5122799e-282d-4b7e-9b3c-92f6422aa795)

## Tools, Software, and Libraries
- MS SQL SERVER STUDIO 19
- Tableau 2024.1.0
- Excel version 2010
