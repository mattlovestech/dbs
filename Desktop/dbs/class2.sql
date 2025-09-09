.headers on
.mode column
/* rename a column using as after the column name */
select name, member_cost as fee from facilities;

select name as facility_name, member_cost as member_fee 
from facilities as fac;

/* concatenate columns together with  || double bars or a pipe */
select first_name || ' ' || last_name as name 
from members;

/* .width can be used to set the width of the columns to show all data */
/*2.3 Challenge: Concatenation */
select first_name || ' ' || last_name as name, 
address || ', ' || zip as full_address
from members;

/* basic string search using like*/
select * from facilities where name like '%Tennis%'; --% percent sign is a wildcard for non-case sensitive text. before and/or after the text
select * from facilities where name like 'tennis court _'; --_ underscore is a wildcard for a single character. before and/or after the text.

/* 2.6 Challenge: Text Search */
select count(*) from members where first_name like '%Tim%'; 

/*match against multiple values with in */
select * from facilities where id in (1,5);
select * from facilities where id =1 or id =5; --same as above but with or

/* look up members who joined after a certain date */
select id, last_name,first_name, join_date 
from members 
where join_date >= '2012-09-01 '; --inherntly the time is set to 00:00:00 on this date

/* lookup memebrs who join between two dates */
select id, last_name,first_name, join_date 
from members 
where join_date >= '2012-09-01' 
and join_date < '2012-09-02';

select id, last_name,first_name, join_date 
from members 
where join_date between '2012-09-01' 
and '2012-09-02'; --same as above but with between

/* 2.11 Challenge: Date Search */
/* find all books that are scheduled to take place on 2012-07-11 */
select * from bookings 
where start_time >= '2012-07-11 00:00:00' 
and start_time < '2012-07-12 00:00:00'; 

/*advanced dates and times*/
select date('now'); --returns the current date
select date('now', 'start of month'); --returns the current date minus 1 day


/*2.15 Challenge: Distinct, Order By, Limit*/
/* get a list of the distinc zip codes for members*/
select distinct zip from members;

/*-- get a list of the cheaperst facilities for guests*/
select name, guest_cost from 
facilities order by guest_cost 
asc limit 5; -- find the 5 cheapests facilities ascending from 0

/* get a list of members ordered by join_date descending from most recent*/
select * from members order by join_date desc; -- starts with most recent and goes to oldest

/* case /when then end to create branching paths*/
select name, 
monthly_maintenance,
    case 
        when monthly_maintenance > 1000 then 'expensive'
        when monthly_maintenance > 100 then 'average'
        else 'cheap' --optional (default value is blank)
    end as cost
from facilities;

/* 2.18 Challenge: Case Statements */
/* get a list of all the members and add a column that indicates if they were recommended or not*/
select first_name || ' ' || last_name as name,
    case 
        when recommended_by is not null then 'recommended'
        else 'not recommended'
    end as recommended_status
from members;

/* aggrega fucntions work on an entire column */
select max(join_date) as latest from members; --this is the latest date and not the actual column

/* 2.21 Challenge: Aggregate Functions */

/* challenge = what is the most expensive facility to maintain on a monthly basis*/

/* max monthly maintenance */
select max(monthly_maintenance) as max_monthly_maintenance from facilities;

/* records where monthly maintenance is the max */
select * from facilities where monthly_maintenance = (select max(monthly_maintenance) from facilities);

/* subqueries are queries inside of queries */
select first_name, last_name, join_date from members where id = (select id from members order by join_date desc limit 1);

/*joining tables together*/
/* in joins you need an id = primary key in one table and foreign key in the other */
select start_time
from bookings
join members 
    on bookings.member_id = members.id
where first_name = 'David' 
and last_name = 'Jones';


select * from bookings
join members
on bookings.member_id = members.id;

/* JOIN LOGIC
1) from [tables]
2)  where [conditions]
3) select [columns]
4) order by limit, group by, asc, etc.
*/


/* get all member ids for people who have booked tennis courts 1 or 2 */
select distinct member_id from bookings
join facilities
on bookings.facility_id = facilities.id
where name = 'Tennis Court 1' 
or name = 'Tennis Court 2' order by member_id asc;

/* joining a table to itself */
select members.first_name,
members.last_name,
recommenders.first_name,
recommenders.last_name from members 
join members as recommenders -- we are doing this because we want to see for each member who they were recommended by
on members.recommended_by = recommenders.id;


/* three way join of tables */