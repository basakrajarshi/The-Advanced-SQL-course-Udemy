select 
nvl(region_id, 0),
nvl(sub_region_id, 0),
sum(population)
from eba_countries
group by nvl(region_id, 0),
nvl(sub_region_id, 0);

select 
nvl(region_id, 0),
nvl(sub_region_id, 0),
sum(population)
from eba_countries
group by 
(nvl(region_id, 0), nvl(sub_region_id, 0));

select 
nvl(region_id, 0),
nvl(sub_region_id, 0),
sum(population)
from eba_countries
group by 
(nvl(region_id, 0), nvl(sub_region_id, 0), nvl(organization_region_id, 0));

select 
nvl(region_id, 0),
nvl(sub_region_id, 0),
sum(population)
from eba_countries
group by nvl(organization_region_id, 0),
(nvl(region_id, 0), nvl(sub_region_id, 0));

-----------------------------------------------------------------------------

select
nvl(region_id, 0),
nvl(sub_region_id, 0),
sum(population)
from 
eba_countries
group by cube(nvl(region_id, 0), nvl(sub_region_id, 0));

select
nvl(region_id, 0),
nvl(sub_region_id, 0),
grouping_id(nvl(region_id, 0), nvl(sub_region_id, 0)),
sum(population)
from 
eba_countries
group by rollup(nvl(region_id, 0), nvl(sub_region_id, 0));

select
nvl(region_id, 0),
nvl(sub_region_id, 0),
grouping_id(nvl(region_id, 0), nvl(sub_region_id, 0)),
sum(population)
from 
eba_countries
group by cube(nvl(region_id, 0), nvl(sub_region_id, 0));

select
nvl(region_id, 0),
nvl(sub_region_id, 0),
nvl(organization_region_id, 0),
grouping_id(nvl(region_id, 0), nvl(sub_region_id, 0), nvl(organization_region_id, 0)),
sum(population)
from 
eba_countries
group by rollup(nvl(region_id, 0), nvl(sub_region_id, 0), nvl(organization_region_id, 0));

select
nvl(region_id, 0),
nvl(sub_region_id, 0),
nvl(organization_region_id, 0),
grouping_id(nvl(region_id, 0), nvl(sub_region_id, 0), nvl(organization_region_id, 0)),
sum(population)
from 
eba_countries
group by cube(nvl(region_id, 0), nvl(sub_region_id, 0), nvl(organization_region_id, 0));

select
nvl(region_id, 0),
nvl(sub_region_id, 0),
nvl(organization_region_id, 0),
sum(population)
from 
eba_countries
group by grouping sets(nvl(region_id, 0), nvl(sub_region_id, 0), nvl(organization_region_id, 0), ());

select
nvl(region_id, 0),
nvl(sub_region_id, 0),
nvl(organization_region_id, 0),
sum(population)
from 
eba_countries
group by grouping sets((nvl(region_id, 0), nvl(sub_region_id, 0)), nvl(organization_region_id, 0), ());

select
nvl(region_id, 0),
nvl(sub_region_id, 0),
nvl(organization_region_id, 0),
sum(population)
from 
eba_countries
group by nvl(organization_region_id, 0), grouping sets((nvl(region_id, 0), nvl(sub_region_id, 0)), ());

