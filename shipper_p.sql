DELIMITER $$ 
CREATE PROCEDURE shipper_p()
BEGIN
    INSERT INTO vehdb1.shipper_t (
	SHIPPER_ID, 
	SHIPPER_NAME,
	SHIPPER_CONTACT_DETAILS
	)
    SELECT DISTINCT
   	SHIPPER_ID, 
	SHIPPER_NAME,
	SHIPPER_CONTACT_DETAILS

FROM vehicles_t WHERE SHIPPER_ID NOT IN (SELECT DISTINCT SHIPPER_ID FROM shipper_t);
END;

-- select count(distinct shipper_id) from  shipper_t;
-- CALL vehdb1.shipper_p();