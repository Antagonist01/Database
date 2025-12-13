-- find the deviation of each sale from both
-- the minimum and maximum sales amounts.

select
OrderID,
OrderDate,
ProductID,
sales,
max(sales) over () MaxSale,
min(sales) over () MinSale,
Sales - min(sales) over () DeviationFromMin,
Sales- max(sales) over () DeviationFromMax
from
sales.orders

--calculate the moving avg of sales for each product over
-- time

select OrderID,
OrderDate,
ProductID,
sales,
avg(sales) over (partition by productID) MovingAvg,
avg(sales) over (partition by productID order by orderdate) MovingAvg1
from
sales.Orders

--calculate the moving average of sales for each product
-- over time, including only the next order

select OrderID,
OrderDate,
ProductID,
sales,
avg(sales) over (partition by productID) MovingAvg,
avg(sales) over (partition by productID order by orderdate) MovingAvg1,
avg(sales) over (partition by productID order by orderdate rows between current row and 1 following) MovingAvg2 --rolling avg
from
sales.Orders