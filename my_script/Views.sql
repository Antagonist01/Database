-- Find the running total of sales for each month

With Cte_Monthly_Summary as (
		select
		datetrunc(month, OrderDate) OrderMonth,
		sum(sales) totalSales,
		count(OrderID) TotalOrders,
		sum(Quantity) TotalQuantities
		from
		sales.Orders
		group by datetrunc(month, OrderDate)

)
select 
OrderMonth,
totalsales,
sum(totalSales) over (order by orderMonth) RunningTotal
from
Cte_Monthly_Summary



-------------------------------------------------------------


If OBJECT_ID('Sales.V_Monthly_Summary', 'V') is not NUll
Drop view sales.V_Monthly_Summary;
Go
create view sales.V_Monthly_Summary as 
(
	    select
		datetrunc(month, OrderDate) OrderMonth,
		sum(sales) totalSales,
		count(OrderID) TotalOrders,
		sum(Quantity) TotalQuantities
		from
		sales.Orders
		group by datetrunc(month, OrderDate)
)

select *
from
sales.V_Monthly_Summary  



--Task :Provide a view that combines details
--from orders, products, customers, and employees

create view sales.V_Order_Details as (
	select
	o.OrderID,
	o.OrderDate,
	o.sales,
	o.Quantity,
	p.Product,
	p.Category,
	coalesce(c.FirstName, '')+' '+ coalesce (c.LastName, '') as CustomerName,
	c.Country CustomerCountry,
	coalesce(e.FirstName, '')+' '+ coalesce (e.LastName, '') as SalesName,
	e.Department
	from sales.Orders o
	left join sales.Products p 
	on o.ProductID=p.ProductID
	left join sales.customers c
	on o.CustomerID = c.CustomerID
	left join sales.Employees e
	on o.SalesPersonID = e.EmployeeID
)


 --Task: Provide a view for the EU sales team
 --that combines details from all tables and excludes
 --data related to the USA.

 Create view sales.V_Order_Details_EU as (
    select
	o.OrderID,
	o.OrderDate,
	o.sales,
	o.Quantity,
	p.Product,
	p.Category,
	coalesce(c.FirstName, '')+' '+ coalesce (c.LastName, '') as CustomerName,
	c.Country CustomerCountry,
	coalesce(e.FirstName, '')+' '+ coalesce (e.LastName, '') as SalesName,
	e.Department
	from sales.Orders o
	left join sales.Products p 
	on o.ProductID=p.ProductID
	left join sales.customers c
	on o.CustomerID = c.CustomerID
	left join sales.Employees e
	on o.SalesPersonID = e.EmployeeID
	where c.country != 'USA'
)


