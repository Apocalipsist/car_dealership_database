-- Car DEALERSHIP

CREATE TABLE dealership(
	dealer_id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	address VARCHAR(100),
	email VARCHAR(100)
);

SELECT *
FROM dealership;

CREATE TABLE car(
	car_id SERIAL PRIMARY KEY,
	color VARCHAR(10),
	car_year NUMERIC(4,0),
	car_make VARCHAR(40),
	car_model VARCHAR(50),
	vin_number VARCHAR(50),
	dealer_id INTEGER,
	invoice_id INTEGER,
	emp_id INTEGER,
	FOREIGN KEY(dealer_id) REFERENCES dealership(dealer_id),
	FOREIGN KEY(emp_id) REFERENCES sales_person(emp_id)
);


CREATE TABLE customer(
	customer_id SERIAL PRIMARY KEY,
	name VARCHAR(50),
	address VARCHAR(100),
	email VARCHAR(100),
	reward_member BOOLEAN DEFAULT FALSE
);

CREATE TABLE service_ticket(
	service_id SERIAL PRIMARY KEY,
	service_desc VARCHAR(50),
	price NUMERIC(8,2),
	service_date TIMESTAMP,
	customer_id INTEGER,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
);


CREATE TABLE sales_person(
	emp_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50)
);

CREATE TABLE invoice(
	invoice_id SERIAL PRIMARY KEY,
	invoice_num NUMERIC(8,0),
	price NUMERIC(8,2),
	invoice_date TIMESTAMP,
	customer_id INTEGER,
	car_id INTEGER,
	emp_id INTEGER,
	FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
	FOREIGN KEY(car_id) REFERENCES car(car_id),
	FOREIGN KEY(emp_id) REFERENCES sales_person(emp_id)
);



CREATE TABLE mechanic(
	mechanic_id SERIAL PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50)
);


CREATE TABLE service_vehicle(
	service_id INTEGER,
	mechanic_id INTEGER,
	FOREIGN KEY(service_id) REFERENCES service_ticket(service_id),
	FOREIGN KEY(mechanic_id) REFERENCES mechanic(mechanic_id)
);

