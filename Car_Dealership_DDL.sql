---------------------
-- Car Dealership DDL
---------------------


----------
-- Tables
----------


-- Salesperson
---------------

CREATE TABLE salesperson (
  salesperson_id SERIAL PRIMARY KEY,
  first_name VARCHAR not null,
  last_name VARCHAR not null,
  city VARCHAR(20) DEFAULT 'Newport News',
  state VARCHAR(2) DEFAULT 'VA',
  phone VARCHAR not null,
  email_address VARCHAR not null
);

select *
from salesperson;


-- Customer
------------

CREATE TABLE customer (
  customer_id SERIAL PRIMARY KEY,
  first_name VARCHAR not null,
  last_name VARCHAR not null,
  address VARCHAR not null,
  city VARCHAR(20) DEFAULT 'Newport News' not null,
  state VARCHAR(2) DEFAULT 'VA' not null,
  phone VARCHAR,
  email_address VARCHAR
);

select *
from customer;


-- Car
-------

CREATE TABLE car (
  car_id SERIAL PRIMARY KEY,
  "year" INTEGER not null,
  make VARCHAR not null,
  model VARCHAR not null,
  salesperson_id INTEGER,
  customer_id INTEGER not null,
  FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id),
  FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

select *
from car;


-- Invoice
-----------

CREATE TABLE invoice (
  invoice_id SERIAL PRIMARY KEY,
  "date" TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  price NUMERIC(8,2),
  car_id INTEGER not null,
  salesperson_id INTEGER not null,
  customer_id INTEGER not null,
  FOREIGN KEY(car_id) REFERENCES car(car_id),
  FOREIGN KEY(salesperson_id) REFERENCES salesperson(salesperson_id), 
  FOREIGN KEY(customer_id) REFERENCES customer(customer_id) 
);

select *
from invoice;


-- Mechanic
------------

CREATE TABLE mechanic (
  mechanic_id SERIAL PRIMARY KEY,
  first_name VARCHAR not null,
  last_name VARCHAR not null,
  city VARCHAR(20) DEFAULT 'Newport News',
  state VARCHAR(2) DEFAULT 'VA',
  phone VARCHAR not null,
  email_address VARCHAR
);

select *
from mechanic;


-- Service Ticket
------------------

CREATE TABLE service_ticket (
  service_ticket_id SERIAL PRIMARY KEY,
  service_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  car_id INTEGER not null,
  customer_id INTEGER not null,
  FOREIGN KEY(car_id) REFERENCES car(car_id),
  FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);

select *
from service_ticket;


-- Service Record
------------------

CREATE TABLE service_record (
  service_record_id SERIAL PRIMARY KEY,
  service_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  service_description TEXT not null,
  car_id INTEGER not null,
  mechanic_id INTEGER not null,
  FOREIGN KEY(car_id) REFERENCES car(car_id),
  FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id)
);

select *
from service_record;

---------------------------
-- Alter Table information
---------------------------


-- Invoice
-----------

alter table invoice
rename column "date" to invoice_date; 

-- Customer
------------

alter table customer 
add column auto_service_club_member boolean default false;

