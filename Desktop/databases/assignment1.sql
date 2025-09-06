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

/* 4. 	Write a query to return all job offers students accepted from Google
		(First, find Google's company ID and use that to search for offers 
		with that company ID) */

/* 5.	Write a query to return all job offers with salaries over $160,000 */

/* 6.	Write a query to return all job offers with a bonus between
		(and including) $35,000 and $40,000. */

/* 7. 	Write a query to return the names of all companies that were 
		on-campus recruiters in either 2015 or 2016, but not in both  */

/* 8. 	Write a query that displays each company's revenue per employee. */

/* 9. 	Save the contents of the students, offers, and companies tables to CSV files */

/* 10.	Save the student_id, company_id, and total comp (salary + bonus + equity) 
		of all of the accepted offers to a CSV file called accepted_offers.csv */

/* Bonus: 	Are there any students with the exact same name? e.g. Are there two John Smiths?
			Write a comment explaining how you determined your answer. */
