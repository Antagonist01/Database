select 
CustomerID
from
sales.Orders



-- Find the products that have a higher price than
-- the average price of all products



--main query
select 
*
from
--subquery 
(
select 
ProductID,
Price,
avg(Price) over() AvgPrice
from sales.Products)t
where price > AvgPrice



-- Q : Rank customers based on their total amount of sales

select
*,
Rank() over(order by TotalSale desc) CustomerRrank
from(
select 
CustomerID,
Sum(Sales) TotalSale
from sales.Orders
group by CustomerID)t


-- Show the product IDs, product names, prices, and 
-- total number of orders



select 
	ProductID,
	Product,
	Price,
	(select count(*) totalOrder from sales.Orders) as TotalOrders
from sales.products 



-- Q: Show all customer details and find the total orders
-- for each customer. 

--main query
select 
c.*,
o.TotalOrders
from sales.Customers c
left join (
select
customerID,
count(*) TotalOrders
from sales.Orders
Group by CustomerID) o
on c.CustomerID =o.CustomerID




-- Q: Find the products that have a price higher
-- than the average price of all products


--main query
select
productID,
price
from
sales.Products
where Price > (select avg(Price) from sales.Products)



-- Q: Show the details of orders made 
-- by customers in Germany


select *
from
sales.orders
where CustomerID  IN 
(select CustomerID
from
sales.Customers
where Country = 'Germany')



-- Find female employees whose salaries are greater
-- than the salaries of any male employees

-- main query
select 
EmployeeID,
gender,
Salary
from sales.Employees
where gender = 'F'
and Salary > Any(select Salary from sales.Employees where gender = 'M');




-- Find female employees whose salaries are greater
-- than the salaries of all male employees

 
































