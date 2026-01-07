-- show all customers details and find the total orders of each customer

select *,

(select count(*) from sales.Orders o where o.CustomerID = c.CustomerID) totalSales
from
sales.Customers c


-- show th edetails of the orders made by the customers in Germany

--main query
select *
from sales.orders o
where Exists (select 1
		from sales.Customers c
		where country = 'Germany'
		and o.CustomerID = c.CustomerID
		)
		 




