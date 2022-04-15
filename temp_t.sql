
CREATE TABLE temp_t(

shipper_id INTEGER,
shipper_name VARCHAR(50),
shipper_contact_details VARCHAR(30),
product_id INTEGER,
vehicle_maker VARCHAR(60),
vehicle_model VARCHAR (60),
vehicle_color VARCHAR(60),
vehicle_model_year INTEGER,
vehicle_price DECIMAL(14,2),
quantity INTEGER,
discount DECIMAL(4,2),
customer_id VARCHAR (30),
customer_name VARCHAR (30),
gender VARCHAR(10),
job_title VARCHAR (50),
phone_number VARCHAR (30),
email_address VARCHAR (50),
city VARCHAR (30),
country VARCHAR (40),
state VARCHAR (40),
customer_address VARCHAR (50),
order_date DATE,
order_id VARCHAR(25),
ship_date DATE,
ship_mode  VARCHAR (25),
shipping  VARCHAR (30),
postal_code INTEGER,
credit_card_type VARCHAR(50),
credit_card_number BIGINT,
customer_feedback  VARCHAR (25),
quarter_number INTEGER,

PRIMARY KEY (CUSTOMER_ID, SHIPPER_ID, PRODUCT_ID, ORDER_ID)
);

-- DROP TABLE vehdb1.temp_t;