# DATA CLEANING
set sql_safe_updates =0;
UPDATE Blinkit_Data 
SET 
    Item_Fat_Content = CASE
        WHEN Item_Fat_Content IN ('LF' , 'low fat') THEN 'Low Fat'
        WHEN Item_Fat_Content = 'reg' THEN 'Regular'
        ELSE Item_Fat_Content
    END;

set sql_safe_updates =1;
SELECT 
    *
FROM
    Blinkit_Data;
SELECT 
    CAST(SUM(sales) / 1000000 AS DECIMAL (10 , 2 )) AS Total_sales_Millions
FROM
    Blinkit_Data
WHERE
    `Outlet Establishment Year` = 2022;
SELECT 
    CAST(AVG(sales) AS DECIMAL (10 , 0 )) AS Average_Sales
FROM
    Blinkit_data;
SELECT 
    COUNT(*) AS Number_of_Items
FROM
    blinkit_data;
SELECT 
    CAST(AVG(Rating) AS DECIMAL (10 , 2 )) AS Average_Rating
FROM
    blinkit_data;
