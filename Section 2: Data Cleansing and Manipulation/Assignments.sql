select * from 
(select sal, job, deptno from emp)
pivot (sum(sal) for job in ('PRESIDENT', 'MANAGER', 'ANALYST', 'CLERK', 'SALESMAN'));

select * from goals_per_season
unpivot(goals for season in (YEAR_2018 as '2018', YEAR_2019 as '2019', YEAR_2020 as '2020'));
