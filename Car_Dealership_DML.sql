----------------------
-- Car Dealership DML
----------------------


insert into customer(
	first_name,
	last_name,
	address,
	city,
	state,
	phone,
	email_address
) values (
	'Monti',
	'Hines',
	'114221 Konoha Village',
	'Newport News',
	'VA',
	'757-555-1234',
	'cd.mhines@gmail.com'	
);

insert into salesperson(
	first_name,
	last_name,
	phone,
	email_address
) values (
	'Mickey',
	'Yekcim',
	'757-555-5555',
	'mickey2@whomail.com'	
);

---------------------
-- Stored Procedures
---------------------


-- Salesperson
------------------------------------

CREATE OR REPLACE PROCEDURE add_salesperson(
  first_name VARCHAR,
  last_name VARCHAR,
  city VARCHAR(20),
  state VARCHAR(2),
  phone VARCHAR,
  email_address VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
  INSERT INTO salesperson (first_name, last_name, city, state, phone, email_address)
  VALUES (first_name, last_name, city, state, phone, email_address);
END;
$$;

-- Add New Salesperson Data
----------------------------

call add_salesperson('Rachel', 'Cortez', 'Hampton', 'VA', '757-534-5435', 'cortezr@dsfklj.com');
call add_salesperson('Trystan', 'Calhoun', 'Manchester Township', 'NJ', '757-111-2222', 'tcalhoun@asdf.com');
call add_salesperson('Yadiel', 'Moody', 'Dundalk', 'MD', '757-101-0101', 'moody4lyfe@yadiel.com');



-- Customer 
--------------------------------------------

CREATE OR REPLACE PROCEDURE add_customer(
  first_name VARCHAR,
  last_name VARCHAR,
  address VARCHAR,
  city VARCHAR(20),
  state VARCHAR(2),
  phone VARCHAR,
  email_address VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
  INSERT INTO customer(first_name, last_name, address, city, state, phone, email_address)
  VALUES (first_name, last_name, address, city, state, phone, email_address);
END;
$$;

-- Add New Customer Data
-------------------------

call add_customer('Skyler', 'Figueroa', '8436 Park St.', 'Kansas City', 'MO', '(475) 669-2377', 'skylerf@nomail.com');
call add_customer('Makai', 'Knight', '7907 Rockcrest Street', 'Flushing', 'NY', '(772) 880-6981', 'blackknight@coolname.com');
call add_customer('Talia', 'Savage', '7906 Second St.', 'Omaha', 'NE', '(976) 944-8250', 'savage1@alghul.com');



-- Car
--------------------------------------------

CREATE OR REPLACE PROCEDURE add_car(
  "year" INTEGER,
  make VARCHAR,
  model VARCHAR,
  salesperson_id INTEGER,
  customer_id INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
  INSERT INTO car("year", make, model, salesperson_id, customer_id)
  VALUES ("year", make, model, salesperson_id, customer_id);
END;
$$;

--drop procedure if exists add_car;
-- Add New Car Data
--------------------
call add_car(2013, 'Hyundai', 'Sonata', 1, 1);
call add_car(2012, 'Peterbult', '210', 4, 2);
call add_car(2001, 'Buell', 'M2 Cyclone', 1, 3);
call add_car(2013, 'Acura', 'ILX', 2, 4);



-- Invoice
--------------------------------------------

CREATE OR REPLACE PROCEDURE add_new_sale_invoice(
  price NUMERIC(8,2),
  car_id INTEGER,
  salesperson_id INTEGER,
  customer_id INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
  INSERT INTO invoice(price, car_id, salesperson_id, customer_id)
  VALUES (price, car_id, salesperson_id, customer_id);
END;
$$;

-- Add Sale Invoice Data
-------------------------

call add_new_sale_invoice(6500, 1, 1, 1);
call add_new_sale_invoice(45000, 2, 4, 2);
call add_new_sale_invoice(52361, 4, 2, 4);
call add_new_sale_invoice(33654, 3, 1, 3); 



-- Mechanic
--------------------------------------------

CREATE OR REPLACE PROCEDURE add_mechanic(
  first_name VARCHAR,
  last_name VARCHAR,
  city VARCHAR(20),
  state VARCHAR(2),
  phone VARCHAR,
  email_address VARCHAR
)
LANGUAGE plpgsql
AS $$
BEGIN
  INSERT INTO mechanic(first_name, last_name, city, state, phone, email_address)
  VALUES (first_name, last_name, city, state, phone, email_address);
END;
$$;

-- Add New Mechanic Data
-------------------------

call add_mechanic('Roger', 'Regor', 'Hampton', 'VA', '757-098-7654', 'mechanicroger@fixcars.com');
call add_mechanic('Jamez', 'Withazee', 'Virginia Beach', 'VA', '757-012-3456', 'itzjamez@fixcars.com');
call add_mechanic();



-- Service Ticket
--------------------------------------------

CREATE OR REPLACE PROCEDURE add_service_ticket(
  car_id INTEGER,
  customer_id INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
  INSERT INTO service_ticket(car_id, customer_id)
  VALUES (car_id, customer_id);
END;
$$;

-- Add Service Ticket Data
---------------------------

call add_service_ticket(4, 4);
call add_service_ticket(2, 2);
call add_service_ticket(3, 3);



-- Service Record
--------------------------------------------

CREATE OR REPLACE PROCEDURE add_new_service_record(
  service_description TEXT,
  car_id INTEGER,
  mechanic_id INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
  INSERT INTO service_record(service_description, car_id, mechanic_id)
  VALUES (service_description, car_id, mechanic_id);
END;
$$;

-- Add Service Record Data
---------------------------

call add_new_service_record('Installed new Brakes and Rotors', 4, 2);
call add_new_service_record('Replaced Headcover Gasket', 2, 2);
call add_new_service_record('Oil and Oil filter Change', 2, 1);


-- Update Auto Service Service Club Membership
-----------------------------------------------

update customer
set auto_service_club_member = TRUE
where customer_id = 3;

update customer
set auto_service_club_member = TRUE
where customer_id = 1;



-- Remove Car, Customer, Salesperson from table
------------------------------------------------

delete from car
where car_id >= 5;

delete from customer
where customer_id >= 5;

delete from salesperson 
where salesperson_id >= 5;

