--Analzye the month-over-month(MoM)performance by 
-- finding the percentage change in sales between the current and 
-- previous month

select *,
CurentMonthSales - PreviousMonthSales as MoM_Change,
Round(cast((CurentMonthSales - PreviousMonthSales) as float)/PreviousMonthSales * 100, 1) as MoMPerc
from(
select 
month (OrderDate) OrderMonth,
sum(sales) CurentMonthSales,
Lag(sum(sales)) over (order by month (OrderDate) ) PreviousMonthSales
from sales.Orders
group by month (OrderDate))t


-- Analyze customer loyalty by ranking customers based on the
-- average number of days between orders 
select CustomerID,
avg(DaysUntilNextOrder) Avgdays,
Rank() over (order by coalesce(avg(DaysUntilNextOrder), 99999)) RankAvg
from(
select
orderID,
customerID,
orderdate CurrentOrder,
Lead(orderdate) over (partition by customerID order by Orderdate) NextOrder,
datediff(day, OrderDate, Lead(orderdate) over (partition by customerID order by Orderdate)) DaysUntilNextOrder
from sales.orders
)t
group by 
CustomerID

--Find the lowest and highest sales for each product

select 
orderID,
ProductID,
sales,
first_value(sales) over (partition by ProductID order by sales) lowestsales,
last_value (sales) over (partition by ProductID order by sales
rows between current row and unbounded following) highestSale
From sales.Orders

--OR 
select 
orderID,
ProductID,
sales,
first_value(sales) over (partition by ProductID order by sales) lowestsales,
first_value (sales) over (partition by ProductID order by sales desc) highestSale,
Sales - first_value(sales) over (partition by ProductID order by sales) salesDiff
From sales.Orders



 








