select
country,
avg (score) as Avg_Score
from
customers
where score != 0
group by country
having avg (score)>= 450