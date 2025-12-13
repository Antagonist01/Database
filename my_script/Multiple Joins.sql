use SalesDB

select 
o.OrderID,
o.Sales,
c.Firstname as customerFirstName,
c.LastName as customerLastName,
p.Product as ProductName,
p.Price,
e.FirstName as EmployeeFirstName,
e.LastName as EmployeeLastName
from Sales.Orders as o 
left join sales.Customers as c
on o.CustomerID = c.CustomerID
left join sales.Products as p
on o.ProductID = p.ProductID
left join sales.Employees as E
on o.SalesPersonID = E.EmployeeID

select * from sales.Customers
select * from sales.Orders
select * from sales.Employees
select * from sales.Products