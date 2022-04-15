TRUNCATE vehdb1.temp_t;
LOAD DATA LOCAL INFILE 'C:/Users/Tomek/Desktop/Artificia Intelligence-UT Austin II/PROJECT 2/Data/new_wheels_sales_qtr_4.csv' -- change this location to load another week
INTO TABLE vehdb1.temp_t
FIELDS TERMINATED by ','
OPTIONALLY ENCLOSED BY '"' 
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

