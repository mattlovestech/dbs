/* Intro to Databases for Business Analytics - Assignment #1
Completed by: */

/* 1. 	Write a query to select all companies. */
 select * from companies; -- selecting all rows from the companies table

/* 2. 	Write a query to find the student with the last name Robinson
		and an undergrad GPA of 3.77 */
select *
from students -- selecting all students that meet below conditions
where last_name = 'Robinson' -- last name must be 'Robinson' (case sensitive)
and gpa = 3.77; --GPA must be 3.77 exactly 

/* 3. 	Write a query to find any job offers that the student above has received
		(use the student's ID that you determined from the previous query) */
select * 
from offers 
where student_id = (select id from students where last_name = 'Robinson' and gpa = 3.77);

/* 4. 	Write a query to return all job offers students accepted from Google
		(First, find Google's company ID and use that to search for offers 
		with that company ID) 
		
		*/

/* finding google's company id */
select id from companies where name = 'Google'; --company id is 19

/* find accepted offers from google */
select * from offers
where company_id = (select id from companies where name = 'Google') --alternatively, we could just hard code 19
and offer_accepted = 1;

/* 5.	Write a query to return all job offers with salaries over $160,000 */

select * from offers
where salary > 160000;

/* 6.	Write a query to return all job offers with a bonus between
		(and including) $35,000 and $40,000. */

select * from offers
where bonus between 35000 and 40000;


/* 7. 	Write a query to return the names of all companies that were 
		on-campus recruiters in either 2015 or 2016, but not in both  */

		select * from companies
where (on_campus_recruiter_2015 = 1 and not on_campus_recruiter_2016 = 1) 
or (on_campus_recruiter_2016 = 1 and not on_campus_recruiter_2015 = 1);

/* 8. 	Write a query that displays each company's revenue per employee. */

select name, revenue / number_of_employees as revenue_per_employee from companies;

/* 9. 	Save the contents of the students, offers, and companies tables to CSV files */
.mode csv

.once students.csv
select * 
from students;

.once offers.csv
select * 
from offers;

.once companies.csv
select * 
from companies;

.mode column

/* 10.	Save the student_id, company_id, and total comp (salary + bonus + equity) 
		of all of the accepted offers to a CSV file called accepted_offers.csv */
.mode csv
.once accepted_offers.csv
select student_id, company_id,
salary + bonus + equity as total_comp
from offers
where offer_accepted = 1;
.mode column

/* Bonus: 	Are there any students with the exact same name? e.g. Are there two John Smiths?
			Write a comment explaining how you determined your answer. */

/* There are many studnets with the exact same first name and last name. 
I found this documentation below to help me find duplicates by grouping by the same and first and last name. 
Then I only returned the groups that had more than 1, meaning there were duplicates. 

Documentation: https://www.atlassian.com/data/sql/how-to-find-duplicate-values-in-a-sql-table
*/

select first_name, last_name, count(*) 
from students 
group by first_name, last_name 
having count(*) > 1; --returns back many groups with the same first and last name.

