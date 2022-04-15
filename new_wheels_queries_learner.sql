/* QUESTIONS RELATED TO CUSTOMERS */

-- [Q1] What is the distribution of customers across states?
SELECT state, count(customer_id) as Client_Count
FROM veh_prod_cust_v
GROUP BY 1
ORDER BY 2 DESC;
-- since customer_ID is unique in customer table, we dont need to use  distinct in above query

-- [Q2] What is the average rating in each quarter?    
SELECT quarter_number,
    AVG(CASE WHEN customer_feedback= "Very Bad" THEN 1
        WHEN customer_feedback= "Very Bad" THEN 2
        WHEN customer_feedback= "Ok" 		THEN 3
        WHEN customer_feedback= "Good"		THEN 4
        WHEN customer_feedback= "Very Good"THEN 4
        END) AS AVERAGE_RATING
	FROM veh_ord_cust_v
    GROUP BY 1
    ORDER BY 1;

-- Very Bad is 1, Bad is 2, Okay is 3, Good is 4, Very Good is 5.

-- [Q3] Are customers getting more dissatisfied over time?

	SELECT quarter_number,
    AVG(CASE WHEN customer_feedback= "Very Bad" THEN 1
        WHEN customer_feedback= "Very Bad" THEN 2
        WHEN customer_feedback= "Ok" 		THEN 3
        WHEN customer_feedback= "Good"		THEN 4
        WHEN customer_feedback= "Very Good"THEN 4
        END) AS AVERAGE_RATING
	FROM veh_ord_cust_v
    GROUP BY 1
    ORDER BY 1;
     
      -- my dates data did not ingest :(
		-- OVER (PARTITION BY quarter_number)
-- [Q4] Which are the top 5 vehicle makers preferred by the customer.
	SELECT
		vehicle_maker, sum(quantity) AS Sales
        FROM veh_prod_cust_v t1 JOIN
        veh_ord_cust_v t2
        ON t2.customer_id=t1.customer_id
        GROUP BY 1
        ORDER BY 2 DESC
        LIMIT 5;
	

-- [Q5] What is the most preferred vehicle make in each state?
-- use rank function
-- PART 1 - find favorite vehicle maker per state
SELECT
		t2.state, vehicle_maker, sum(quantity) AS Sales
        FROM veh_prod_cust_v t1 JOIN
        veh_ord_cust_v t2
        ON t2.customer_id=t1.customer_id
        GROUP BY 1
        ORDER BY 1 ;
-- PART 2
-- Rank most favorite vehicle makers per each state

WITH CTE AS
(
SELECT
		t2.state, vehicle_maker, sum(quantity) AS Model_sales
        FROM veh_prod_cust_v t1 JOIN
        veh_ord_cust_v t2
        ON t2.customer_id=t1.customer_id
        GROUP BY 2
        ORDER BY 2 DESC
    
) SELECT state, vehicle_maker, Model_sales,
		DENSE_RANK() OVER (PARTITION BY state ORDER BY Model_sales DESC ) AS Ranking
FROM CTE;


/* QUESTIONS RELATED TO REVENUE and ORDERS */

-- [Q6] What is the trend of number of orders by quarters?
SELECT quarter_number,count(t1.order_id) AS Orders
FROM veh_ord_cust_v t1
JOIN
veh_prod_cust_v t2
ON t1.order_id=t2.order_id
GROUP BY 1 ORDER BY 1;


-- [Q7] What is the quarter over quarter % change in revenue? 
-- THIS IS IN PROJECT REVIEW SESSION  1.04H IN VIDEO
SELECT quarter_number,calc_revenue_f1(quantity,vehicle_price,discount)/sum(calc_revenue_f1(quantity,vehicle_price,discount))*100 AS Q_Revenues
FROM veh_ord_cust_v
GROUP BY 1 ORDER BY 1;


-- [Q8] What is the trend of revenue and orders by quarters?
--  Number of orders is dropping as seen in Question 6
-- Revenues are also dropping as seen by output of code below :
SELECT quarter_number,calc_revenue_f1(quantity,vehicle_price,discount) AS Q_Revenues
FROM veh_ord_cust_v
GROUP BY 1 ORDER BY 1;
 

/* QUESTIONS RELATED TO SHIPPING */

-- [Q9] What is the average discount offered for different types of credit cards?
SELECT credit_card_type, AVG(discount) AS AVG_discount
FROM veh_ord_cust_v
GROUP BY 1 ORDER BY 2 DESC;

-- [Q10] What is the average time taken to ship the placed orders for each quarters?
-- Use days_to_ship_f function to compute the time taken to ship the orders.

SELECT QUARTER_NUMBER, AVG(DAYS_TO_SHIP_F1(ORDER_DATE, SHIP_DATE)) AS Ave_Ship_Days
FROM veh_ord_cust_v
GROUP BY 1 ORDER BY 1;
