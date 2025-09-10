/*
===============================================================================
Union All Silver Monthly Tables
===============================================================================
    ⚠ WARNING:
    - Ensure that all monthly silver tables (silver.tripdata_jan ... silver.tripdata_dec)
      already exist and contain data before running this script.
    - This script creates a new consolidated table (silver.tripdata_all) 
      and unions all months into it.
    - Use the "load_silver_tbl_month" script first.
    - so the order is "crt_silver_tbl" --> "load_silver_tbl_month" --> "load_silver_tbl_year"

    Purpose:
    - Combine all monthly data into one master table for easier querying.
===============================================================================
*/

-- Drop consolidated table if it exists
IF OBJECT_ID('silver.tripdata_year', 'U') IS NOT NULL
    DROP TABLE silver.tripdata_year;

-- Create consolidated table
CREATE TABLE silver.tripdata_all (
    member_casual NVARCHAR(50),
    rideable_type NVARCHAR(50),
    started_at DATETIME2(3),
    ended_at DATETIME2(3)
);

-- Insert all months into one table
INSERT INTO silver.tripdata_all
SELECT * FROM silver.tripdata_jan
UNION ALL
SELECT * FROM silver.tripdata_feb
UNION ALL
SELECT * FROM silver.tripdata_mar
UNION ALL
SELECT * FROM silver.tripdata_apr
UNION ALL
SELECT * FROM silver.tripdata_may
UNION ALL
SELECT * FROM silver.tripdata_jun
UNION ALL
SELECT * FROM silver.tripdata_jul
UNION ALL
SELECT * FROM silver.tripdata_aug
UNION ALL
SELECT * FROM silver.tripdata_sep
UNION ALL
SELECT * FROM silver.tripdata_oct
UNION ALL
SELECT * FROM silver.tripdata_nov
UNION ALL
SELECT * FROM silver.tripdata_dec;
