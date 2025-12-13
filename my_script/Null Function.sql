select customerID,
score,
avg (score)over () avgscores,
avg(coalesce (score, 0)) over () AVG
from sales.customers


 
select customerid,
firstname + ' ' + coalesce(lastname, '') as fullName,
coalesce (score, 0) + 10 as Bonus
from sales.Customers


select customerID,
score
from sales.customers
order by case when score is null then 1 else 0  End, score


select orderid,
Quantity,
Sales,
sales/ nullif (quantity, 0) as price
from sales.Orders


select CustomerID,
 FirstName
from sales.customers
where score is not null


-- List all the customers who have not placed any orders
select c.*,
o.OrderID
from sales.customers as C
left join sales.Orders as O
on c.CustomerID = o.CustomerID
where o.CustomerID is null
