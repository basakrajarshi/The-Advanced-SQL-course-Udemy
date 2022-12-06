select
nvl(sub_region_id, 0),
nvl(organization_region_id, 0),
sum(population)
from
eba_countries
group by rollup(nvl(sub_region_id, 0), nvl(organization_region_id, 0));

select
nvl(sub_region_id, 0),
nvl(organization_region_id, 0),
grouping_id(nvl(sub_region_id, 0), nvl(organization_region_id, 0)) as group_id,
sum(population)
from
eba_countries
group by cube(nvl(sub_region_id, 0), nvl(organization_region_id, 0));

select
nvl(region_id, 0),
nvl(sub_region_id, 0),
nvl(organization_region_id, 0),
sum(population)
from
eba_countries
group by grouping sets((nvl(region_id, 0), nvl(sub_region_id, 0)), (nvl(sub_region_id, 0), nvl(organization_region_id, 0)));
