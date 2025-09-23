
/*

auth to db
run the below in terminal
----
psql postgres://student:password@introtodatabases.cqbjxttyshvk.us-east-1.rds.amazonaws.com:5432/introtodatabases

then run \include attendance.sql
*/
 select * from attendance where uni = 'mlm2387';
insert into attendance (first_name, last_name, uni) values ('Matthew', 'Manning', 'mlm2387');
 select * from attendance where uni = 'mlm2387';
--  select date_trunc('day', timestamp) as day, 
--  count(distinct timestamp) as unique_sign_ins
--  from attendance
--  group by day;

--  select date_trunc('day', timestamp) as day, 
--  count(distinct uni) as unique_uni_sign_ins
--  from attendance
--  group by day;

 /*sign ins per uni*/
--  select uni, count(*) as sign_ins
--  from attendance
--  group by uni
--  order by sign_ins desc;
 
 /* UNIQUE SIGINS PER DAY */

-- select timestamp, count(distinct uni) as unique_signs_per_day
-- from attendance
-- group by timestamp
-- order by timestamp asc;

