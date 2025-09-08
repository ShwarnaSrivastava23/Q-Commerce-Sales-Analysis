# TOTAL SALES BY OUTLET ESTABLISHMENT
SELECT 
    `Outlet Location Type`,
    Item_Fat_Content,
    CAST(SUM(sales) AS DECIMAL (10 , 2 )) AS Total_sales,
    CAST(AVG(sales) AS DECIMAL (10 , 0 )) AS Average_Sales,
    COUNT(*) AS Number_of_Items,
    CAST(AVG(Rating) AS DECIMAL (10 , 2 )) AS Average_Rating
FROM
    blinkit_data
GROUP BY `Outlet Location Type`, Item_Fat_Content
ORDER BY Total_Sales ASC;
WITH norm AS (
  SELECT 
    `Outlet Location Type` AS olt,
    CASE 
      WHEN UPPER(TRIM(Item_Fat_Content)) IN ('LOW FAT','LF') THEN 'Low Fat'
      WHEN UPPER(TRIM(Item_Fat_Content)) IN ('REGULAR','REG') THEN 'Regular'
      ELSE Item_Fat_Content
    END AS fat,
    sales
  FROM blinkit_data
)
SELECT
  olt AS `Outlet Location Type`,
  CAST(COALESCE(SUM(CASE WHEN fat = 'Low Fat' THEN sales END), 0) AS DECIMAL(10,2)) AS Low_Fat,
  CAST(COALESCE(SUM(CASE WHEN fat = 'Regular' THEN sales END), 0) AS DECIMAL(10,2)) AS Regular
FROM norm
GROUP BY olt
ORDER BY olt;
SELECT 
    `Outlet Establishment Year`,
    CAST(SUM(sales) AS DECIMAL (10 , 2 )) AS Total_Sales
FROM
    blinkit_data
GROUP BY `Outlet Establishment Year`
ORDER BY Total_Sales ASC;