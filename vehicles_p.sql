DELIMITER $$ 
CREATE PROCEDURE vehicles_p()
BEGIN
	INSERT INTO vehdb1.vehicles_t (
SHIPPER_ID,
SHIPPER_NAME,
SHIPPER_CONTACT_DETAILS,
PRODUCT_ID,
VEHICLE_MAKER ,
VEHICLE_MODEL,
VEHICLE_COLOR,
VEHICLE_MODEL_YEAR,
VEHICLE_PRICE,
QUANTITY,
DISCOUNT,
CUSTOMER_ID,
CUSTOMER_NAME,
GENDER,
JOB_TITLE,
PHONE_NUMBER,
EMAIL_ADDRESS,
CITY,
COUNTRY,
STATE,
CUSTOMER_ADDRESS,
ORDER_DATE,
ORDER_ID,
SHIP_DATE,
SHIP_MODE, 
SHIPPING,
POSTAL_CODE,
CREDIT_CARD_TYPE,
CREDIT_CARD_NUMBER,
CUSTOMER_FEEDBACK,
QUARTER_NUMBER
	) SELECT * FROM vehdb1.temp_t;
END;

-- select count(*) from vehicles_t;
-- CALL vehicles_p();