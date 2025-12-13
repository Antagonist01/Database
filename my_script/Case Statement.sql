-- Create a report showing total sales for each of the categories:
--High(sales over 50), Medium(sales 20-50), low (sales 20 o4 below)
-- Sort the categories from the highest sales to lowest
select category,
sum(sales) as totalsale
from(
select OrderID,
Sales,
case
	when sales>50 then 'High'
	when sales >20 then 'Medium'
	else 'low'
end Category
from
sales.orders)t
group by Category
order by totalsale desc


--Retrive employee details with gender displayed as full text

select  EmployeeID, FirstName,
LastName,
case
	when Gender = 'M' then 'Male'
	when Gender = 'F' then 'Female'
	else 'undefined'
end as Gender
from sales.Employees 


-- Retrieve customer details with abbreviated country code

select *,
case 
	when country = 'Germany' then 'GE'
	when country = 'USA' then 'US'
	else 'Not Available'
END
from sales.Customers;

select distinct country
from sales.Customers

--Count how many times each customer has made an order with sales greater
-- than 300

Select
customerID,
SUM (case	
	when sales> 30 then 1
	else 0
End) TotalOrdersHighSales,
count (*) TotalOrders
from
sales.Orders
group by CustomerID








