/* Intro to Databases for Business Analytics - Assignment #3
Completed by: Matthew Manning mlm2387*/

-- I used this chatgpt query for help https://chatgpt.com/c/68d1ea1d-e85c-832e-8384-6be0120e585b

/* 1.   Write a query that returns that average GMAT score for all sponsored students 
        (sponsored_student = 1), rounded to the nearest decimal point */
        select round(avg(gmat), 1) as average_gmat
        from students
        where sponsored_student = 1;

/* 2.   Write a query that returns the average GMAT score by prior_industry, 
        rounded to the nearest decimal */
         select prior_industry, round(avg(gmat), 1) as average_gmat 
        from students
        where sponsored_student = 1 
        group by prior_industry;

/* 3.   Write a query that returns the highest overall compensation package, 
        including salary, bonus, and equity */
        select 
        max(salary + bonus + equity) as total_compensation
        from offers;


/* 4.   Write a query to determine how many students born in 1990 worked in each 
        industry before school */
        select prior_industry, count(*) as number_of_students
        from students
        where dob between '1990-01-01' and '1991-01-01'
        group by prior_industry;

/* 5.   Write a query that returns that total number of offers received by the
        student body in each month. */
        select strftime('%Y-%m', offer_issue_date) as month
        ,count(*) as number_of_offers
        from offers
        group by month;

/* 6.   Return a table of the number of offers made by each company showing only 
        companies that have made more than 40 offers */
        select offers.company_id, companies.name, count(*) as number_of_offers
        from offers
        join companies on offers.company_id = companies.id
        group by companies.id
        having count(*) > 40;

/* 7.   Write a query to return the first name and last name as a SINGLE COLUMN and 
        GMAT score of the first five student who received an offer from Google */
        select students.first_name || ' ' || students.last_name as name, students.gmat, offers.offer_issue_date
        from students
        join offers on students.id = offers.student_id
        where offers.company_id = (select id from companies where name = 'Google')
        order by offers.offer_issue_date asc
        limit 5;

/* 8.   Write a query to return the company names for the 10 companies who had the 
        most ACCEPTED job offers, ordered from most to least */
        select offers.company_id, companies.name, count(*) as number_of_accepted_offers
        from offers
        join companies on offers.company_id = companies.id
        where offers.offer_accepted = 1
        group by companies.id
        order by number_of_accepted_offers desc
        limit 10;