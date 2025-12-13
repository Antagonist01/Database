select upper (first_name) as firstname ,
country,
concat (first_name,' ' , country) as name_country
from customers 

select first_name,
len (first_name) len_name,
len(trim(first_name)) as Len_Trim_Name,
len (first_name) - len(trim(first_name)) Flag
from customers
--where first_name != TRIM(first_name)

select
'report.txt',
replace ('report.txt', '.txt', '.json')

select first_name,
SUBSTRING (trim(first_name), 2, Len(first_name) ) as name
from customers