--create table
-- we will import the csv file to create the table

/* 4.9 Deleting Tables + Challenge */
drop table if exists movies; -- at the beginning of the file it will delete the table and create again from scratch
.mode csv
create table movies ( -- it could be a create unless exists
-- list all columns
id text primary key, --primary key we can join columns with
title text not null,
year integer not null,
score real default 0.0,
votes integer default 0,
length text default '0 mins.',
genre text
);
.import imdb_top_10000.csv movies
.mode column

--.schema will show what the create table command will be to create the db using sqlite
/* challenge 4.5 - Creating Tables Challenge */
-- create a table for actors
drop table if exists actors;
create table actors (
id text primary key,
name text,
dob text,
birth_place text,
bio text
photo_url text
);

-- create a table for directors
drop table if exists directors;
create table directors (    
id text primary key,
name text,
dob text,
birth_place text,
bio text,
photo_url text
);

insert into movies (title, year) 
values ('Inside Out', 2015);

/* 4.11 Challenge: Inserting Data */
-- found id in the url of the imdb pages
-- estimated votes based on info on the imdb pages (rounds to nearest hundred in ui ex. 4.6k)
insert into movies (id, title, year, score, votes, length, genre) 
values ('tt0106356', 'Barbarians at the Gate', 1993, 7.2, 3600, '107 mins.', 'Biography|Comedy|Drama');

insert into movies (id, title, year, score, votes, length, genre) 
values ('tt1719634', 'Snow on tha Bluff', 2011, 6.6, 2700, '79 mins.', 'Crime|Drama');

insert into movies (id, title, year, score, votes, length, genre) 
values ('tt6285944', 'The Banker', 2020, 7.3, 41000, '120 mins.', 'Biography|Drama');

/* 4.15 Challenge: Updating Your Data (~5.5 mins) */
update movies set 
id = 'tt0106356',
year = 1993,
score = 7.2,    
votes = 3600,
length = '107 mins.',
genre = 'Biography|Comedy|Drama'
where title = 'Barbarians at the Gate';

update movies set 
id = 'tt1719634',
year = 2011,
score = 6.6,
votes = 2700,
length = '79 mins.',
genre = 'Crime|Drama'
where title = 'Snow on tha Bluff';

update movies set 
id = 'tt6285944',
year = 2020,
score = 7.3,
votes = 41000,
length = '120 mins.',
genre = 'Biography|Drama'
where title = 'The Banker';

-- delete from movies where title = 'Snow on tha Bluff';
-- delete all movies with title containing 'Inside'
delete from movies where id in 
(select id from movies where title like '%Inside%');

-- find duplicate titles
-- Find duplicate titles (shows the titles and how many times they appear)
select title, count(*) as occurrences
from movies
group by title
having count(*) > 1;

delete from movies where id = 'id';
/* Take a peak at our movies table */

select substr(title, 1, 5)
from movies;

select length(title)
from movies limit 5;

select substr(title, 1, length(title)-7), year
from movies
where title like '% (____)%'; --underscore is a wildcard for a single character

select * from movies limit 5;
update movies
set title = substr(title, 1, length(title)-7)
where title like '% (____)%';

select * from movies limit 5;

update movies set length = substr(length, 1, length(length)-6) where length like '% mins.%';
select * from movies limit 5;

drop table if exists movies_temp;
alter table movies
rename to movies_temp;

.tables
/* Create table */
/*  */
drop table if exists movies;
create table movies (
id integer primary key,
imdb_id text,
title text,
year integer,
score real, 
votes integer,
length integer,
genre text
);

.tables

/* copy data from movies_temp to movies */
insert into movies (imdb_id, title, year, score, votes, length, genre)
select id, title, year, score, votes, length, genre
from movies_temp;

drop table if exists movies_temp;
.tables