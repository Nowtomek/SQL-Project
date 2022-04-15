-- TOTAL REVENUE
SELECT sum(calc_revenue_f1(quantity,vehicle_price,discount)) AS Total_Revenue
FROM veh_ord_cust_v;

-- TOTAL ORDERS
SELECT COUNT(ORDER_ID) FROM order_t;

-- TOTAL CLIENTS
SELECT COUNT(CUSTOMER_ID) FROM customer_t;

-- AVERAGE  RATING
SELECT 
    AVG(CASE WHEN customer_feedback= "Very Bad" THEN 1
        WHEN customer_feedback= "Very Bad" THEN 2
        WHEN customer_feedback= "Ok" 		THEN 3
        WHEN customer_feedback= "Good"		THEN 4
        WHEN customer_feedback= "Very Good"THEN 4
        END) AS AVERAGE_RATING
	FROM veh_ord_cust_v;
    
    -- LAST QUARTER REVENUE
SELECT quarter_number,calc_revenue_f1(quantity,vehicle_price,discount) AS Last_Q_Revenue
FROM veh_ord_cust_v
where quarter_number = 4
GROUP BY 1;

-- LAST QUARTER ORDERS
SELECT quarter_number,count(order_id) AS Last_Q_Orders
FROM order_t
where quarter_number = 4
GROUP BY 1;

-- AVERAGE DAYS TO SHIP
SELECT QUARTER_NUMBER, AVG(DAYS_TO_SHIP_F1(ORDER_DATE, SHIP_DATE)) AS Ave_Ship_Days
FROM veh_ord_cust_v; 