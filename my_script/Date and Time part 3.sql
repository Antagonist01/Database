select 
month(orderdate) as OrderDate,
 avg (datediff(day, OrderDate,ShipDate)) as ShippingDuration
from
sales.Orders
group by month(orderdate)

select
orderid,
orderdate currentorderdate,
lag(orderdate) over (order by orderdate) previousorderdate,
datediff(day,lag(orderdate) over (order by orderdate),orderdate)
from
sales.orders


select isdate('2025-08-2') date