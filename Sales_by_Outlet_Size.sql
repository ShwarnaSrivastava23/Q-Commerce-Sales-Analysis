#Percentage of Sales by Outlet Size
select `Outlet Size`,
cast(sum(sales) as decimal(10,2)) as total_sales,
cast((sum(sales)*100.0 / sum(sum(sales)) over()) as decimal (10,2)) as sales_percentage
from blinkit_data
group by `Outlet Size`
order by Total_sales desc;
