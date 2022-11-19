select * from stores where regexp_like(physical_address, '[A-Z][A-Z] \d{5}$');
select * from customers where regexp_like(name, '(S|s)te(ph|v)en');


select name, regexp_instr(name, 'n') from eba_countries  where regexp_instr(name,'n') = 7;	
select name from eba_countries where regexp_instr(name, '\(.*\)') > 0


select name, regexp_substr(name, '^A.+a$') from eba_countries;
select name, regexp_substr(name, '^\w+ ') from eba_countries;	


select email_address, regexp_replace(email_address, 'internalmail$', 'internalmail.com') from customers;
select email_address, regexp_replace(email_address, '\.', '-') from customers;
select email_address, regexp_replace(email_address, '(.+)(@)(.+)', '\3\2\1') from customers;
