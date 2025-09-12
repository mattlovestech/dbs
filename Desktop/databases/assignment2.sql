/* Intro to Databases for Business Analytics - Assignment #2
Completed by: */

/* 1. 	Write a query to concatenate each student's first name and last name
		as a combined new column, full_name, and return the first 5 names */

select first_name || ' ' || last_name as full_name 
from students limit 5 
order by id asc; --ordered by id because the question does not say in what way the "first" five names are determined/

/* 2. 	Write a query to return a list of unique last names starting with the letter "A" */

select distinct -- this filters out dupes and gets unique vals
last_name from students 
where last_name like 'A%'; --by adding the percent at the end we say it must start wtih A

/* 3. 	Write a query to return all information for all companies headquarted in NY state */

select * from companies where headquarters
 like '%NY,%'; --we look for NY, which means its in NY state in each row of the headquarters column


/* 4. 	Write a query to return all job offers received on September 10, 11, and 12 in 2021 */
select * from offers where
offer_issue_date between '2021-09-10' and '2021-09-13' --used 9/13 to make sure it includes everything after 00:00 on 9/12
order by offer_issue_date asc; --not necessary but, makes it easier to check work


/* 5. 	Return a list of company names categorized as large (50,000 or more employees),
		medium (5,000 - 49,999 employees), or small (less than 5,000 employees) */
		select name, 
		case
			when number_of_employees >= 50000 then 'large'
			when number_of_employees >= 5000 and number_of_employees < 50000 then 'medium' -- could also just say < 50k
			when number_of_employees < 5000 then 'small'
			else 'unknown' -- just in case there is a value that doesn't fit this logic for some weird reason
		end as size
		from companies;

/* 6. 	Use a subquery to return a list students (first and last name) who received
		the maximum GMAT scores; if there are more than 10, limit your results to 10 students */

select first_name, last_name, gmat
from students 
where gmat = (select max(gmat) from students) 
limit 10;

/* 7. 	Write a query that returns the five students born in 1990 with the lowest undergrad GPAs */

select * from students 
where dob between '1990-01-01' and '1991-01-01' --finds only students born in 1990
order by gpa asc --sorts by gpa
limit 5;
/* 8. 	Write a query to return the starting salaries for all job offers received by Alexander Hernandez. */

select * from offers 
where student_id = (select id 
from students 
where first_name = 'Alexander' 
and last_name = 'Hernandez');


/* 9. 	Write a query to return student id, company id, and total_compensation
		for the five job offers with the highest total_compensation (for
		total_compensation, use salary, bonus, and equity!) */

select student_id, company_id, 
salary + bonus + equity as total_compensation
from offers
order by total_compensation desc
limit 5;

/* 10. 	Modify the previous query by joining the students and the companies table
	  	to display the names of the students and companies in the resulting table
	  	rather than their ids */

select offers.student_id, offers.company_id, 
offers.salary + offers.bonus + offers.equity as total_compensation, 
students.first_name, students.last_name, companies.name as company_name
from offers join students on offers.student_id = students.id
join companies on offers.company_id = companies.id
order by total_compensation desc
limit 5;

/* Bonus: 	Write a query that returns the information of all the
			students who DID NOT receive any offers */
select students.first_name,
students.last_name, students.id as student_id, 
case  -- this case just figures out if a student id exists in the offers table
	when offers.student_id is null then 0
	else 1
end as received_offer
from students
left join offers on students.id = offers.student_id --i used this documentation  https://www.w3schools.com/sql/sql_join_left.asp to add a left join which makes comparing if there is an offe easier 
where received_offer = 0;
