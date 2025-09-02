.mode column
select * from facilities; -- select all rows and columns from the facilities table

/* here is how you write
multiline comments in SQL */

/* select specific columns from a table */
select name, member_cost from facilities; 

select first_name, last_name from members;

/* doing math inside q uery */
select name, monthly_maintenance / member_cost 
from facilities;


/* select specific rows from a a tables where */
/* select columns, from table, where conditions are met */
/* possible conditions: >, <, >=, <=, =, !=, <> */
select * -- all of the rows 
from facilities 
where member_cost > 0;

select * 
from facilities 
where name = 'Squash Court'; -- always use single quotes for strings

select * 
from members
where recommended_by is null; -- null is a special value in SQL

select * 
from facilities
where guest_cost > 5;

select * 
from members
where first_name = 'David';

select name, monthly_maintenance 
from facilities
where monthly_maintenance > 200;

select 
    id, 
    name,
    member_cost,
    monthly_maintenance 
from facilities
where 
    (member_cost > 0) and 
    (member_cost < (monthly_maintenance / 50));


select * 
from facilities
where guest_cost > 5 and member_cost > 5;
