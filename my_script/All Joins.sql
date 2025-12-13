use MyDatabase

select *
from customers
full join orders
on customers.id = orders.customer_id


select *
from customers as c
left join orders as o
on c.id = o.customer_id
where o.customer_id  is not null 



select *
from customers
cross join orders


