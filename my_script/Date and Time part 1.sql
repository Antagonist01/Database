select orderID,
Creationtime,
datepart(year, creationtime) YEar_dp,
datepart(month, creationtime) month_dp,
datepart(day, creationtime) day_dp,
datepart(hour, creationtime) hour_dp,
datepart(quarter, creationtime) quarter_dp,
datepart(weekday, creationtime) weekday_dp,
datepart(week, creationtime) week_dp,
year(CreationTime) year,
MONTH(CreationTime)month,
day(CreationTime) day
from sales.orders

select orderID,
Creationtime,
datename(month, CreationTime) as monthname,
datename(weekday, creationtime)as day
from sales.Orders

select orderID,
Creationtime,
datetrunc(minute, CreationTime) as minute,
datetrunc(year, creationtime) as year
from sales.Orders


select orderid,
creationtime,
EOMONTH(CREATIONTIME) eomonth,
CAST (DATETRUNC(MONTH,CreationTime) AS DATE ) STARTOFmONTH
from SALES.Orders

SELECT
datename (month,orderDate),
 count(*) NoOfOrders
from sales.Orders
group by datename (month, OrderDate)


 