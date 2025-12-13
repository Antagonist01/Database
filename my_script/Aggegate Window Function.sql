select orderID,
       Orderdate,
	   customerID,
       count(*) over () TotalOrders,
	   count(*) over (partition by CustomerID) ordersbyCustomer
from
sales.orders

select
*,
count (score) over () NewScore
from 
sales.Customers


select 
*
from
(select 
orderID,
count(*) over (partition by orderID) CheckPK
from 
sales.OrdersArchive
)t where CheckPK > 1


select OrderID,
OrderDate,
Sales,
ProductID,
sum(sales) over () totalSale,
sum(sales) over (partition by productID) saleProduct
from
sales.orders



--Find the percentage contribution of each product's sales to the total
-- sales
select
orderID,
ProductID,
sales,
sum(sales)over ()totalsale,
round (cast (sales as float)/sum (sales)over () * 100 ,2) totalPercentage
from
sales.Orders

-- find the avg sale across all orders
-- and find the avg sales for each product
-- additionally provide details such orderID, OrderDate

select orderID,
OrderDate,
Sales,
ProductID,
avg(sales) over () AvgSale,
avg(sales) over (partition by ProductID) AvgSaleByProductID
from
sales.Orders


--Find the avg scores of customers
--Additionally provide the details such customersID and Lastname

select
CustomerID, 
LastName,
Score,
avg (coalesce(Score,0)) over () avgscore
from
sales.Customers

--Find all orders where sales are higher than the average sales across all orders

select
*
from
	(select
	Sales,
	avg (sales) over () avgSales
	from
	sales.orders)t
where sales > avgSales 


--find the highest and lowest sales of all orders
-- find the highest and lowest sales for each product
-- additionally provide the details such as OrderID, Orderdate


select
	OrderID,
	OrderDate,
	Sales,
	productID,
	max(sales) over () MaxSale,
	min (sales) over () MinSale,
	max (sales) over (partition by productID) highsalePro,
	min (sales) over (partition by productID) minsalepro
	from
sales.orders

select
	productID,
	Product,
	max(Product) over () MaxSale,
	min (Product) over () MinSale
	from
sales.Products



--show the employees who have the highest salaries
select*
from(
	select FirstName,
	Salary,
	max(Salary) over () MaxsalaryGUY
	from 
	sales.Employees
)t
where Salary=MaxsalaryGUY


--calculate the deviation of each sales from the minimum and maximun sales amounts


































