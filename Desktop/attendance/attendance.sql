
/*

auth to db
run the below in terminal
----
psql postgres://student:password@introtodatabases.cqbjxttyshvk.us-east-1.rds.amazonaws.com:5432/introtodatabases

then run \include attendance.sql
*/

-- insert into attendance (first_name, last_name, uni) values ('Matthew', 'Manning', 'mlm2387');
 select * from attendance where uni = 'mlm2387';

