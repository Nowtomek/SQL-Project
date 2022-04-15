-- DROP FUNCTION days_to_ship_f1;

DELIMITER $$
CREATE FUNCTION DAYS_TO_SHIP_F1 (ORDER_DATE DATE, SHIP_DATE DATE)
RETURNS INTEGER
DETERMINISTIC
BEGIN
	DECLARE DAYS_TO_SHIP INTEGER;
    SET  DAYS_TO_SHIP = DATEDIFF(SHIP_DATE, ORDER_DATE);
    RETURN DAYS_TO_SHIP;
END;

-- time to ship by order
SELECT
	QUARTER_NUMBER,
    ORDER_ID,
    DAYS_TO_SHIP_F1(ORDER_DATE, SHIP_DATE) DAYS_TO_SHIP
FROM vehicles_t
ORDER BY QUARTER_NUMBER ASC, DAYS_TO_SHIP DESC;
-- issue I have here is that the date fields somehow did not populate in tables

-- days to ship on average by Quarter
SELECT
	QUARTER_NUMBER,
    AVG(DAYS_TO_SHIP_F1(ORDER_DATE, SHIP_DATE)) DAYS_TO_SHIP_QUARTERLY
FROM vehicles_t
GROUP BY 1
ORDER BY 1;

-- days to ship average overall
SELECT
    AVG(DAYS_TO_SHIP_F1(ORDER_DATE, SHIP_DATE)) DAYS_TO_SHIP_SUMMARY
FROM vehicles_t;