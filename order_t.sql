CREATE TABLE order_t (
order_id VARCHAR(25),
customer_id VARCHAR (30),
shipper_id INTEGER,
product_id INTEGER,
quantity INTEGER,
vehicle_price DECIMAL(14,2),
order_date DATE,
ship_date DATE,
discount DECIMAL(4,2),
ship_mode  VARCHAR (25),
shipping  VARCHAR (30),
customer_feedback  VARCHAR (25),
quarter_number INTEGER,

PRIMARY KEY (order_id)
);



