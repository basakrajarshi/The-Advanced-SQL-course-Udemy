select
name,
population,
max(population) over(),
population - max(population) over() as diff_from_max_pop
from 
eba_countries;

select
name,
population,
lead(population, 1) over(order by population desc),
population - lead(population, 1) over(order by population desc) as variance
from 
eba_countries;
