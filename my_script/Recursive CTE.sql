-- Generate a sequence of numbers from 1-20.

With Series as
(
	-- Anchor Query
	select 
	1 as MyNumber
	Union All
	-- Recursive Query
	Select 
	MyNumber + 1
	from Series
	where MyNumber < 20 
)
--Main Query
select 
*
from Series
Option (maxrecursion 50)

--Task: Show the employee hierarcy by displaying each employee's 
-- level within the organization
;With CTE_Emp_Hierarcy as
(
--Anchor Query
	select 
	EmployeeID,
	FirstName,
	ManagerID,
	1 as Level
	from 
	sales.employees
	where ManagerID is null
	Union all
	--Recursive Query
	select
	e.EmployeeID,
	e.FirstName,
	e.ManagerID,
	level + 1
	from sales.employees as e
	inner join CTE_Emp_Hierarcy ceh
	on e.managerID = ceh.EmployeeID
 
)
select 
*
from CTE_Emp_Hierarcy