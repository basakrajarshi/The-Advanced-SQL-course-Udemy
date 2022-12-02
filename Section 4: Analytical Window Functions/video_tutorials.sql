select 
name,
sum(population) over()
from eba_countries;

select
name,
population,
region_id,
sum(population) over(partition by region_id)
from eba_countries;

select
name,
population,
region_id,
sub_region_id,
sum(population) over(partition by region_id, sub_region_id)
from eba_countries;

select
name,
population,
region_id,
sub_region_id,
sum(population) over(partition by region_id order by sub_region_id desc)
from eba_countries;

select
name,
population,
region_id,
sub_region_id,
sum(population) over(partition by region_id, sub_region_id order by sub_region_id rows between unbounded preceding and unbounded following) as a,
sum(population) over(partition by region_id, sub_region_id order by sub_region_id rows between 1 preceding and 1 following) as b,
sum(population) over(partition by region_id, sub_region_id order by sub_region_id rows between current row and 2 following) as b
from eba_countries;

select
name,
population,
region_id,
sub_region_id,
sum(population) over(partition by region_id order by sub_region_id range between 1 preceding and 1 following) as a,
sum(population) over(partition by region_id order by sub_region_id range between 0 preceding and 70 following) as b
from eba_countries;

select 
name,
region_id,
sum(population) over(partition by region_id),
min(population) over(partition by region_id),
max(population) over(partition by region_id),
count(population) over(partition by region_id),
avg(population) over(partition by region_id)
from eba_countries;

select 
name,
population,
lag(name) over(order by name),
lag(name, 2) over(order by name),
lag(name, 2, 'blank') over(order by name)
from eba_countries;

select 
name,
population,
lead(name) over(order by name),
lead(name, 2) over(order by name),
lead(name, 2, 'blank') over(order by name)
from eba_countries;

select 
name,
region_id,
population,
ntile(3) over(partition by region_id order by population)
from eba_countries;

select 
name,
region_id,
population,
nth_value(name, 2) over(partition by region_id)
from eba_countries;

select 
name,
population,
row_number() over(order by population),
rank() over(order by population),
dense_rank() over(order by population)
from eba_countries;

select 
name,
population,
row_number() over(partition by region_id order by population),
rank() over(partition by region_id order by population),
dense_rank() over(partition by region_id order by population)
from eba_countries;

select
name,
region_id,
population,
percent_rank() over(partition by region_id order by population),
cume_dist() over(partition by region_id order by population)
from 
eba_countries;
