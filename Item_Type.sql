SELECT 
    `Item Type`,
    CAST(SUM(sales) AS DECIMAL (10 , 2 )) AS Total_sales,
    CAST(AVG(sales) AS DECIMAL (10 , 0 )) AS Average_Sales,
    COUNT(*) AS Number_of_Items,
    CAST(AVG(Rating) AS DECIMAL (10 , 2 )) AS Average_Rating
FROM
    blinkit_data
GROUP BY `Item Type`
ORDER BY Total_Sales DESC;


    
    
    
    