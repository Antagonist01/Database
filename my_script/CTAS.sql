if OBJECT_ID ('Sales.MonthlyOrders', 'U') is not null
drop table sales.MonthlyOrders;
Go
select
datename (month, OrderDate) OrderMonth,
count(orderID) TotalOrders
into Sales.MonthlyOrders
from
sales.Orders
group by datename (month, OrderDate)


select * from
sales.MonthlyOrders