INSERT INTO car (
	color,
	car_year,
	car_make,
	car_model,
	vin_number,
	dealer_id,
	invoice_id,
	emp_id
) VALUES (
	'blue',
	2011,
	'Nissan',
	'Altima',
	'S154CV4F8EW',
	1,
	1,
	1
);


INSERT INTO car (
	color,
	car_year,
	car_make,
	car_model,
	vin_number,
	dealer_id,
	invoice_id,
	emp_id
) VALUES (
	'blue',
	2012,
	'Nissan',
	'Maxima',
	'S1R2T0JV4F8EW',
	1,
	1,
	1
);



INSERT INTO car (
	color,
	car_year,
	car_make,
	car_model,
	vin_number,
	dealer_id,
	invoice_id,
	emp_id
) VALUES (
	'Red',
	1952,
	'Ford',
	'Pickup',
	'S154CV4F8EW',
	2,
	2,
	2
);


SELECT *
FROM car;


CREATE OR REPLACE FUNCTION add_new_customer(name,address,email)

CREATE OR REPLACE PROCEDURE add_new_customer(
	name VARCHAR(50),
	address VARCHAR(100),
	email VARCHAR(50)
)
LANGUAGE plpgsql 
AS $$ 
BEGIN 
	INSERT INTO customer (name, address, email)
	VALUES(name, address, email);
END
$$

CALL add_new_customer('Sebastian Torres', '51 wall street', 'sebtor@gmail.com');
CALL add_new_customer('Savanna Torres', '123 wall street', 'savvygreenup@gmail.com');
CALL add_new_customer('Savanna Torres', '123 wall street', 'savvygreenup@gmail.com');

SELECT *
FROM customer;

DELETE from customer
WHERE customer_id > 2;

CREATE OR REPLACE PROCEDURE add_new_dealership(
	name VARCHAR(50),
	address VARCHAR(100),
	email VARCHAR(100)
)
LANGUAGE plpgsql 
AS $$ 
BEGIN 
	INSERT INTO dealership (name, address, email)
	VALUES(name, address, email);
END
$$

CALL add_new_dealership('Sonia Auto Sales', '135 main st, Worcester, Ma', 'sonia.auto@gmail.com');
CALL add_new_dealership('Ernies Cars', '35 main st, Leominster, Ma', 'Erniescars@gmail.com');

SELECT *
FROM dealership;




CREATE OR REPLACE PROCEDURE add_new_emp(
	first_name VARCHAR(50),
	last_name VARCHAR(50)
)
LANGUAGE plpgsql 
AS $$ 
BEGIN 
	INSERT INTO sales_person (first_name, last_name)
	VALUES(first_name, last_name);
END
$$

CALL add_new_emp('Isahias', 'Torres');
CALL add_new_emp('Bruce', 'Torres');

SELECT *
FROM sales_person;



CREATE OR REPLACE PROCEDURE add_new_mechanic(
	first_name VARCHAR(50),
	last_name VARCHAR(50)
)
LANGUAGE plpgsql 
AS $$ 
BEGIN 
	INSERT INTO mechanic (first_name, last_name)
	VALUES(first_name, last_name);
END
$$

CALL add_new_mechanic('Freddy', 'Vega');
CALL add_new_mechanic('Julio', 'Fuentes');
CALL add_new_mechanic('Ivan', 'Torres');


CREATE OR REPLACE PROCEDURE add_new_invoice(
	invoice_num NUMERIC(8,0),
	price NUMERIC(8,2),
	invoice_date TIMESTAMP,
	customer_id INTEGER,
	car_id INTEGER,
	emp_id INTEGER
)
LANGUAGE plpgsql 
AS $$ 
BEGIN 
	INSERT INTO invoice (invoice_num, price, invoice_date,customer_id,car_id,emp_id)
	VALUES(invoice_num, price, invoice_date,customer_id,car_id,emp_id);
END
$$

CALL add_new_invoice(125352, 35985,'2022-10-23',1,2,1);
CALL add_new_invoice(12005582, 58221.22,'2022-10-22',2,1,2);

SELECT *
FROM invoice;




CREATE OR REPLACE PROCEDURE add_new_ticket(
	service_desc VARCHAR(50),
	price NUMERIC(8,2),
	service_date TIMESTAMP,
	customer_id INTEGER
)
LANGUAGE plpgsql 
AS $$ 
BEGIN 
	INSERT INTO service_ticket (service_desc, price, service_date,customer_id)
	VALUES(service_desc, price, service_date,customer_id);
END
$$

CALL add_new_ticket('shocks', 250,'2022-10-23',1);
CALL add_new_ticket('breaks', 150,'2022-10-23',2);

