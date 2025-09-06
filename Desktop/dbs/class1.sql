/* Change the settings to display
columns and headers */
.mode column
.headers on

-- Select all rows from a table
/* Select all rows from a table */
select * 
from facilities;

/* Select specific columns */
select name, member_cost
from facilities;

/* Selecting Columns Challenge */
select first_name, last_name
from members;

/* Doing math inside a query */
select name, monthly_maintenance / member_cost
from facilities;

/* Select specific rows from a table */
select *
from facilities
where member_cost > 0;

select *
from facilities
where name = 'Squash Court';

select *
from members
where recommended_by is not null;

/* Selecting Rows Challenge */
select *
from facilities
where guest_cost > 5;

select *
from members
where first_name = 'David';

select name, monthly_maintenance
from facilities
where monthly_maintenance >= 200;

/* Combining multiple wheres */
select *
from facilities
where guest_cost > 5 
	and member_cost > 5;

/* Saving to a CSV */
.mode csv 
.once facilities.csv 
select *
from facilities;
.mode column

/* Exporting Data Challenge */
.mode csv

.once members.csv
select * 
from members;

.once bookings.csv
select *
from bookings;

.once member_names.csv
select first_name, last_name
from members;

.mode column




