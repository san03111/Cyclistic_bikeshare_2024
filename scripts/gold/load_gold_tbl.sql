/*
===============================================================================
Load Silver → Gold (Yearly Tripdata with Enrichment)
===============================================================================
⚠ WARNING:
- Ensure the table "gold.tripdata_year" exists before running this script.
- This script loads data from ""silver.tripdata_year" into ""gold.tripdata_year".
- It enriches the data by:
  1. Adding ride duration in minutes
  2. Categorizing duration into groups
  3. Adding season classification based on start month
===============================================================================
*/

INSERT INTO gold.tripdata_year (
    membership_type,
    bike_type,
    start_time_stamp,
    start_date,
    start_month,
    start_day,
    start_day_num,
    start_hour,
    return_time_stamp,
    return_date,
    return_month,
    return_day,
    return_day_num,
    return_hour,
    duration,
    group_duration,
    season
)
SELECT 
    *,
    DATEDIFF(MINUTE, start_time_stamp, return_time_stamp) AS duration,
    CASE 
        WHEN DATEDIFF(MINUTE, start_time_stamp, return_time_stamp) < 10 THEN 'Under 10'
        WHEN DATEDIFF(MINUTE, start_time_stamp, return_time_stamp) BETWEEN 10 AND 30 THEN '10 to 30'
        WHEN DATEDIFF(MINUTE, start_time_stamp, return_time_stamp) BETWEEN 30 AND 60 THEN '30 to 60'
        ELSE 'Over 60'
    END AS group_duration,
    CASE 
        WHEN start_month IN ('February','March','April') THEN 'Spring'
        WHEN start_month IN ('November','December','January') THEN 'Winter'
        WHEN start_month IN ('August','September','October') THEN 'Fall'
        WHEN start_month IN ('May','June','July') THEN 'Summer'
    END AS season
FROM (
    SELECT
        member_casual AS membership_type,
        rideabel_type AS bike_type,
        started_at AS start_time_stamp,
        CAST(started_at AS DATE) AS start_date,
        DATENAME(MONTH, started_at) AS start_month,
        DATENAME(WEEKDAY, started_at) AS start_day,
        DAY(started_at) AS start_day_num,
        DATEPART(HOUR, started_at) AS start_hour,
        ended_at AS return_time_stamp,
        CAST(ended_at AS DATE) AS return_date,
        DATENAME(MONTH, ended_at) AS return_month,
        DATENAME(WEEKDAY, ended_at) AS return_day,
        DAY(ended_at) AS return_day_num,
        DATEPART(HOUR, ended_at) AS return_hour
    FROM silver.tripdata_year
) t
WHERE DATEDIFF(MINUTE, start_time_stamp, return_time_stamp) > 0;
