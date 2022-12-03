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

select
name,
region_id,
population,
percent_rank() over(partition by region_id order by population),
case when
    percent_rank() over(partition by region_id order by population) <= 0.1 then 1
    else 0
end as top10_percentile 
from 
eba_countries;

select
name,
region_id,
population,
sum(population) over(order by population rows between unbounded preceding and current row) as running_total_population
from 
eba_countries;

------------------------------------------------------------------------------------------------------------------------------------------

create view v_orders as
(
select
a.*,
b.order_total
from orders a
left join (select order_id, sum(unit_price * quantity) as order_total from order_items group by order_id) b
on a.order_id = b.order_id
where a.order_status = 'COMPLETE'
);

select
order_id,
customer_id,
order_total, 
rank() over(partition by customer_id order by order_total desc)
from 
v_orders;

select 
order_id,
order_total,
to_char(order_datetime, 'mm-yy') as month_year,
order_total - max(order_total) over(partition by to_char(order_datetime, 'mm-yy')) as diff_from_max
from 
v_orders;

select 
order_id,
order_total,
to_char(order_datetime, 'mm-yy') as month_year,
avg(order_total) over(order by to_number(to_char(order_datetime, 'yymm')) range 2 preceding) as avg3month,
order_total - avg(order_total) over(order by to_number(to_char(order_datetime, 'yymm')) range 2 preceding) as var
from 
v_orders;

select 
year_month,
year_month_total,
sum(year_month_total) over(order by year_month asc rows between unbounded preceding and current row)
from
v_order_year_month;

