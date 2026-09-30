USE regional_sales;

-- Q1 Total Sales KPI validated
SELECT SUM(Amount) AS Total_Sales, SUM(Profit) AS Total_Profit FROM DATA;

-- Q5 Top 3 Customers per Region using WINDOW FUNCTION
SELECT Region, Customer, Sales FROM (
 SELECT Region, Customer, SUM(Amount) AS Sales,
 RANK() OVER(PARTITION BY Region ORDER BY SUM(Amount) DESC) as rnk
 FROM DATA GROUP BY Region, Customer
) t WHERE rnk <= 3;