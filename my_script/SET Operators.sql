select FirstName,
LastName
from 
sales.Customers
intersect
select FirstName,
LastName
from
sales.Employees