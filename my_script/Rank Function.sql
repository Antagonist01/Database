--Rank the orders based on their sales from highest to lowest

select 
	OrderID,
	ProductID,
	Sales,
	ROW_NUMBER() over (order by sales desc) RankOfSales
from
sales.Orders

 select 
	OrderID, 
	ProductID,
	Sales,
	Rank() over (order by sales desc) RankOfSales_Rank,
	Dense_Rank() over (order by sales desc) RankOfSales_Dense
from
sales.Orders


--Find the Top hishest sales for each Product
select *
from(
select orderID,
ProductID,
sales,
ROW_NUMBER() over ( partition by ProductID order by sales desc) RankByProduct
from sales.Orders
)t where RankByProduct = 1

-- find the lowest customers based on their total sales
select *
from (
Select
CustomerID,
sum(sales) TotalSale,
ROW_NUMBER() over (order by sum(sales) asc) as D
from
sales.Orders
group by
CustomerID)t where D <= 2


--Assign unique IDs to the rows of the 'Orders Archive' table

select orderID,
row_number() over(order by orderID) PrimaryKey
from
sales.OrdersArchive


-- Identify duplicate rows in the table "Orders Archive "
-- and return a clean  result without any duplicates

Select *
from(
select 
ROW_NUMBER() over (partition by orderID order by CreationTime Desc) rn,
*
from
sales.OrdersArchive
)t where rn = 1


select
orderID,
sales,
ntile(1) over (order by orderID) onebucket,
ntile(2) over (order by orderID) twobucket,
ntile(3) over (order by orderID) twobucket


from
sales.Orders


-- Segment all orders into 3 categories: high, medium and low sales.

Select *,
	case 
	when Buckets = 1 then 'High'
	When Buckets = 2 then 'Medium'
	When Buckets = 3 then 'low'
	End Salessegmentation
	from
(
Select
orderID,
Sales,
ntile(3) over (order by sales DESC) Buckets
from
sales.Orders)t



-- In order to export the data, divide the orders into 2 groups.
select 
ntile(2) over (order by  OrderID) Buckets,
*
from
sales.Orders


-- Find the products that fall within the highest 40% of the prices
select *,
concat(CumulativePrice*100, '%') 
from(
select *,
cume_dist () over (order by price desc) as CumulativePrice,
percent_rank () over (order by price desc) as percentRank
from
sales.Products)t
where CumulativePrice <= 0.4
