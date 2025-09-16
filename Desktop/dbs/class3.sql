.mode column

/* aggregate functions continue */

select count(*) from members;

/* these are the aggregate functions
avg()
min()
max()
sum()
count()
round( can have function inside of it)
*/

select count(distinct address) from members; --we can either look for *, column, or distinct column
/* 3.2 Challenge: Aggregate Functions Continued */
/* avg member cost for faciliaties */
select avg(member_cost) as avg_member_cost from facilities;
/* avg guest cost for faciliaties */
select avg(guest_cost) as avg_guest_cost from facilities;
/* total initial outlay for faciliaties */
select sum(initial_outlay) as total_initial_outlay from facilities;

/* members who made at least one booking */

select count( distinct member_id) from bookings;

select count(*) 
from (select distinct member_id from bookings);

/*aggregate functions with where clauses*/

select count(*) 
from facilities
 where guest_cost > 10;

/*3.6 Challenge: Where Plus Aggregate Functions*/
 /*how many facilites have a member cost*/
select count(*) from facilities where member_cost > 0;
 /*avg monthly maintence for facilites < 3000 */
select avg(monthly_maintenance) 
from facilities where monthly_maintenance < 3000;

 /* whcih facilits has the most expensive guest cost under $80 */
 select * from facilities 
 where guest_cost < 80 
 order by guest_cost desc limit 1;

 /*aggregate functions by group*/

select recommended_by, count(*) 
from members where recommended_by is not null
group by recommended_by
order by count(*) desc
;

/*3.9 Challenge: Aggregate Functions By Group*/
/*table of with member last name, frequency of last name descending*/
select last_name, count(*) as frequency
from members 
group by last_name 
order by frequency desc;

/* no of slots booked by facility*/
select facility_id, sum(slots) as total_slots
from bookings
group by facility_id
order by total_slots desc;

/*3.12 Challenge: Aggregate Functions By Group 2*/
/*  # of slots booked per facility for sept 2012*/
select facility_id, sum(slots) as total_slots
from bookings
where start_time between '2012-09-01' and '2012-10-01'
group by facility_id
order by total_slots desc;

/*having limits down the number of groups like where does*/
select facility_id, sum(slots) as total_slots
from bookings
group by facility_id
having total_slots > 1000 --in postgress we have to just say sum(slots) because aliases are not allowed in having
order by total_slots desc;

/* grouping things by date*/
select start_time, 
strftime('%Y-%m', start_time) as month
from bookings
limit 10;

/* grouping things by month*/
select start_time, 
strftime('%Y-%m', start_time) as month,
sum(slots) as total_slots
from bookings
group by month
;

/*group by facility and by month*/
select facility_id,
strftime('%Y-%m', start_time) as month,
sum(slots) as total_slots
from bookings
group by facility_id, month;

/* Where vs Having */

select facility_id, count(*) as total_bookings --doesnt work in postgress because its not part of the initial table and is an alias
from bookings 
where start_time 
between '2012-09-01' and '2012-10-01'
group by facility_id
having count(*) > 500
order by total_bookings desc;