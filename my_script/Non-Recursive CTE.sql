

--select 
--sum(SO.sales) TotalSales,
--SC.FirstName,
--SO.CustomerID
--from sales.Orders SO
--inner join sales.Customers SC
--on SC.CustomerID =  SO.CustomerID
--group by SO.CustomerID,
--SC.FirstName;



--step 1 : Find the total sales per customer (standalone CTE)
;WITH CTE_Total_Sales AS
(
select
	CustomerID,
	sum(sales) as TotalSale
from sales.Orders
group by CustomerID
)
--Step2 : Find the last order date per customer (standalone CTE).  
, CTE_Last_Order as
(
select
CustomerID,
max (OrderDate) as last_order
from
sales.Orders
group by CustomerID
)
--step 3 : Rank customers based on total sales per customer (Nested CTE)
, CTE_Cusomer_Rank as
(
Select
customerID,
TotalSale,
rank () over (order by totalsale desc) as customerrank
from
CTE_Total_Sales
)

--Step 4: segment customers based on their total sales  (Nested CTE)
, CTE_customer_segment as
(
Select
CustomerID,
totalsale,
case 
	when Totalsale > 100 then 'High'
	when totalsale > 80 then 'Medium'
	else 'low'
end CustomerSegment
from 
CTE_Total_Sales
)
-- main query
select 
c.CustomerID,
c.FirstName,
c.LastName,
cts.TotalSale,
clo.last_order,
ccr.customerrank,
ccs.CustomerSegment
from
sales.Customers c
left join CTE_Total_Sales cts
on cts.CustomerID = c.CustomerID
left join CTE_Last_Order clo
on clo.CustomerID = c.CustomerID
left join CTE_Cusomer_Rank ccr
on ccr.CustomerID = c.CustomerID
left join CTE_customer_segment ccs 
on ccs.CustomerID = c.CustomerID





























