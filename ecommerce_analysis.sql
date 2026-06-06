-- Query 1 Business Overview
SELECT 
    COUNT() as Total_Transactions,
    COUNT(DISTINCT User_ID) as Total_Customers,
    COUNT(DISTINCT Category) as Total_Categories,
    ROUND(SUM(Final_Price(Rs.)), 2) as Total_Revenue,
    ROUND(AVG(Final_Price(Rs.)), 2) as Avg_Order_Value
FROM ecommerce_dataset_updated;

-- Query 2 Revenue by Category
SELECT
    Category,
    COUNT() as Total_Transactions,
    ROUND(SUM(Final_Price(Rs.)), 2) as Total_Revenue,
    ROUND(AVG(Final_Price(Rs.)), 2) as Avg_Order_Value
FROM ecommerce_dataset_updated
GROUP BY Category
ORDER BY Total_Revenue DESC;

-- Query 3 Payment Method Analysis
SELECT
    Payment_Method,
    COUNT() as Total_Transactions,
    ROUND(SUM(Final_Price(Rs.)), 2) as Total_Revenue,
    ROUND(AVG(Final_Price(Rs.)), 2) as Avg_Order_Value
FROM ecommerce_dataset_updated
GROUP BY Payment_Method
ORDER BY Total_Revenue DESC;

-- Query 4 Discount Impact Analysis
SELECT
    Discount (%),
    COUNT() as Total_Transactions,
    ROUND(AVG(Final_Price(Rs.)), 2) as Avg_Order_Value
FROM ecommerce_dataset_updated
GROUP BY Discount (%)
ORDER BY Discount (%) ASC;

-- Query 5 Monthly Sales Trend
SELECT 
    SUBSTR(Purchase_Date, 4, 2) as Month,
    COUNT() as Total_Transactions,
    ROUND(SUM(Final_Price(Rs.)), 2) as Total_Revenue
FROM ecommerce_dataset_updated
GROUP BY SUBSTR(Purchase_Date, 4, 2)
ORDER BY SUBSTR(Purchase_Date, 4, 2);