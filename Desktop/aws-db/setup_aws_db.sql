/* this file is used to setup the aws db */

/* drop existing tables for safety :) */
drop table if exists customers;
drop table if exists sales;
/* create tables */

-- id,first_name,last_name,email,phone

create table customers (
    id text primary key,
    first_name text not null,
    last_name text not null,
    email text not null,
    phone text not null
);

\copy customers from 'customers.csv' with delimiter ',' csv;
select * from customers limit 5;
-- id,product_id,manufacturer,category,product,customer_id,sale_date,sale_time,quantity,price,sale_total
create table sales (
    id text primary key, 
    product_id text not null,
    manufacturer text not null,
    category text not null, 
    product text not null, 
    customer_id text not null, 
    sale_date text not null, 
    sale_time text not null, 
    quantity text not null, 
    price text not null, 
    sale_total text not null 
);

\copy sales from 'sales.csv' with delimiter ',' csv;
select * from sales limit 1;

-- https://www.postgresql.org/docs/9.5/sql-grant.html

 /* remove existing roles */
 drop role if exists analyst;

 /* create new role */
 create role analyst with login password 'analyst';

 /* grant permissions to analyst */
 grant select on customers to analyst;
 grant select on sales to analyst;

