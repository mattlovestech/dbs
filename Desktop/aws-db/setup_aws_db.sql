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
    id text primary key, -- unique identifier for each sale
    product_id text not null, -- identifier for the product sold
    manufacturer text not null, -- name of the product manufacturer
    category text not null, -- product categories, comma-separated
    product text not null, -- product name/description
    customer_id text not null, -- id of the customer who made the purchase
    sale_date text not null, -- date of the sale
    sale_time text not null, -- time of the sale
    quantity text not null, -- number of items sold
    price text not null, -- price per item at sale
    sale_total text not null -- total sale amount
);

\copy sales from 'sales.csv' with delimiter ',' csv;
select * from sales limit 1;