/*
===============================================================================
Create Gold Table: tripdata_year
===============================================================================
⚠ WARNING:
- This script will drop the table "gold.tripdata_year" if it already exists.
- Then it will create a new table "gold.tripdata_year".
- Make sure you want to overwrite this table before running.
- gold.tripdata_year contains the **final table** (ready for analytics/reporting).
- Data source: silver.tripdata_year (cleaned & transformed).
===============================================================================
*/

IF OBJECT_ID('gold.tripdata_year', 'U') IS NOT NULL
    DROP TABLE gold.tripdata_year;

CREATE TABLE gold.tripdata_year (
    membership_type NVARCHAR(15),
    bike_type NVARCHAR(50),
    start_time_stamp DATETIME2(3),
    start_date DATE,
    start_month NVARCHAR(15),
    start_day NVARCHAR(15),
    start_day_num INT,
    start_hour INT,
    return_time_stamp DATETIME2(3),
    return_date DATE,
    return_month NVARCHAR(15),
    return_day NVARCHAR(15),
    return_day_num INT,
    return_hour INT,
    duration INT,
    group_duration NVARCHAR(15),
    season NVARCHAR(15)
);
