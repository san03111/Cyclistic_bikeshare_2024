
/*
===============================================================================
Create new table cyclistic_bikeshare data for each month (Jan - Dec)
===============================================================================
    This script will create a new table for each months. 
    - If the table already exists, it will be dropped first (⚠ all data will be lost).
===============================================================================
*/

-- drop the table if it already exist
-- January
IF OBJECT_ID('bronze.tripdata_jan', 'U') IS NOT NULL
    DROP TABLE bronze.tripdata_jan;
GO
CREATE TABLE bronze.tripdata_jan (
    ride_id NVARCHAR(50),
    rideable_type NVARCHAR(50),
    startet_at NVARCHAR(50),
    ended_at NVARCHAR(50),
    start_station_name NVARCHAR(255),
    start_station_id NVARCHAR(50),
    end_station_name NVARCHAR(255),
    end_station_id NVARCHAR(50),
    start_lat FLOAT,
    start_lng FLOAT,
    end_lat FLOAT,
    end_lng FLOAT,
    member_casual NVARCHAR(50)
);
GO

-- February
IF OBJECT_ID('bronze.tripdata_feb', 'U') IS NOT NULL
    DROP TABLE bronze.tripdata_feb;
GO
CREATE TABLE bronze.tripdata_feb (
    ride_id NVARCHAR(50),
    rideable_type NVARCHAR(50),
    startet_at NVARCHAR(50),
    ended_at NVARCHAR(50),
    start_station_name NVARCHAR(255),
    start_station_id NVARCHAR(50),
    end_station_name NVARCHAR(255),
    end_station_id NVARCHAR(50),
    start_lat FLOAT,
    start_lng FLOAT,
    end_lat FLOAT,
    end_lng FLOAT,
    member_casual NVARCHAR(50)
);
GO

-- March
IF OBJECT_ID('bronze.tripdata_mar', 'U') IS NOT NULL
    DROP TABLE bronze.tripdata_mar;
GO
CREATE TABLE bronze.tripdata_mar (
    ride_id NVARCHAR(50),
    rideable_type NVARCHAR(50),
    startet_at NVARCHAR(50),
    ended_at NVARCHAR(50),
    start_station_name NVARCHAR(255),
    start_station_id NVARCHAR(50),
    end_station_name NVARCHAR(255),
    end_station_id NVARCHAR(50),
    start_lat FLOAT,
    start_lng FLOAT,
    end_lat FLOAT,
    end_lng FLOAT,
    member_casual NVARCHAR(50)
);
GO

-- April
IF OBJECT_ID('bronze.tripdata_apr', 'U') IS NOT NULL
    DROP TABLE bronze.tripdata_apr;
GO
CREATE TABLE bronze.tripdata_apr (
    ride_id NVARCHAR(50),
    rideable_type NVARCHAR(50),
    startet_at NVARCHAR(50),
    ended_at NVARCHAR(50),
    start_station_name NVARCHAR(255),
    start_station_id NVARCHAR(50),
    end_station_name NVARCHAR(255),
    end_station_id NVARCHAR(50),
    start_lat FLOAT,
    start_lng FLOAT,
    end_lat FLOAT,
    end_lng FLOAT,
    member_casual NVARCHAR(50)
);
GO

-- May
IF OBJECT_ID('bronze.tripdata_may', 'U') IS NOT NULL
    DROP TABLE bronze.tripdata_may;
GO
CREATE TABLE bronze.tripdata_may (
    ride_id NVARCHAR(50),
    rideable_type NVARCHAR(50),
    startet_at NVARCHAR(50),
    ended_at NVARCHAR(50),
    start_station_name NVARCHAR(255),
    start_station_id NVARCHAR(50),
    end_station_name NVARCHAR(255),
    end_station_id NVARCHAR(50),
    start_lat FLOAT,
    start_lng FLOAT,
    end_lat FLOAT,
    end_lng FLOAT,
    member_casual NVARCHAR(50)
);
GO

-- June
IF OBJECT_ID('bronze.tripdata_jun', 'U') IS NOT NULL
    DROP TABLE bronze.tripdata_jun;
GO
CREATE TABLE bronze.tripdata_jun (
    ride_id NVARCHAR(50),
    rideable_type NVARCHAR(50),
    startet_at NVARCHAR(50),
    ended_at NVARCHAR(50),
    start_station_name NVARCHAR(255),
    start_station_id NVARCHAR(50),
    end_station_name NVARCHAR(255),
    end_station_id NVARCHAR(50),
    start_lat FLOAT,
    start_lng FLOAT,
    end_lat FLOAT,
    end_lng FLOAT,
    member_casual NVARCHAR(50)
);
GO

-- July
IF OBJECT_ID('bronze.tripdata_jul', 'U') IS NOT NULL
    DROP TABLE bronze.tripdata_jul;
GO
CREATE TABLE bronze.tripdata_jul (
    ride_id NVARCHAR(50),
    rideable_type NVARCHAR(50),
    startet_at NVARCHAR(50),
    ended_at NVARCHAR(50),
    start_station_name NVARCHAR(255),
    start_station_id NVARCHAR(50),
    end_station_name NVARCHAR(255),
    end_station_id NVARCHAR(50),
    start_lat FLOAT,
    start_lng FLOAT,
    end_lat FLOAT,
    end_lng FLOAT,
    member_casual NVARCHAR(50)
);
GO

-- August
IF OBJECT_ID('bronze.tripdata_aug', 'U') IS NOT NULL
    DROP TABLE bronze.tripdata_aug;
GO
CREATE TABLE bronze.tripdata_aug (
    ride_id NVARCHAR(50),
    rideable_type NVARCHAR(50),
    startet_at NVARCHAR(50),
    ended_at NVARCHAR(50),
    start_station_name NVARCHAR(255),
    start_station_id NVARCHAR(50),
    end_station_name NVARCHAR(255),
    end_station_id NVARCHAR(50),
    start_lat FLOAT,
    start_lng FLOAT,
    end_lat FLOAT,
    end_lng FLOAT,
    member_casual NVARCHAR(50)
);
GO

-- September
IF OBJECT_ID('bronze.tripdata_sep', 'U') IS NOT NULL
    DROP TABLE bronze.tripdata_sep;
GO
CREATE TABLE bronze.tripdata_sep (
    ride_id NVARCHAR(50),
    rideable_type NVARCHAR(50),
    startet_at NVARCHAR(50),
    ended_at NVARCHAR(50),
    start_station_name NVARCHAR(255),
    start_station_id NVARCHAR(50),
    end_station_name NVARCHAR(255),
    end_station_id NVARCHAR(50),
    start_lat FLOAT,
    start_lng FLOAT,
    end_lat FLOAT,
    end_lng FLOAT,
    member_casual NVARCHAR(50)
);
GO

-- October
IF OBJECT_ID('bronze.tripdata_oct', 'U') IS NOT NULL
    DROP TABLE bronze.tripdata_oct;
GO
CREATE TABLE bronze.tripdata_oct (
    ride_id NVARCHAR(50),
    rideable_type NVARCHAR(50),
    startet_at NVARCHAR(50),
    ended_at NVARCHAR(50),
    start_station_name NVARCHAR(255),
    start_station_id NVARCHAR(50),
    end_station_name NVARCHAR(255),
    end_station_id NVARCHAR(50),
    start_lat FLOAT,
    start_lng FLOAT,
    end_lat FLOAT,
    end_lng FLOAT,
    member_casual NVARCHAR(50)
);
GO

-- November
IF OBJECT_ID('bronze.tripdata_nov', 'U') IS NOT NULL
    DROP TABLE bronze.tripdata_nov;
GO
CREATE TABLE bronze.tripdata_nov (
    ride_id NVARCHAR(50),
    rideable_type NVARCHAR(50),
    startet_at NVARCHAR(50),
    ended_at NVARCHAR(50),
    start_station_name NVARCHAR(255),
    start_station_id NVARCHAR(50),
    end_station_name NVARCHAR(255),
    end_station_id NVARCHAR(50),
    start_lat FLOAT,
    start_lng FLOAT,
    end_lat FLOAT,
    end_lng FLOAT,
    member_casual NVARCHAR(50)
);
GO

-- December
IF OBJECT_ID('bronze.tripdata_dec', 'U') IS NOT NULL
    DROP TABLE bronze.tripdata_dec;
GO
CREATE TABLE bronze.tripdata_dec (
    ride_id NVARCHAR(50),
    rideable_type NVARCHAR(50),
    startet_at NVARCHAR(50),
    ended_at NVARCHAR(50),
    start_station_name NVARCHAR(255),
    start_station_id NVARCHAR(50),
    end_station_name NVARCHAR(255),
    end_station_id NVARCHAR(50),
    start_lat FLOAT,
    start_lng FLOAT,
    end_lat FLOAT,
    end_lng FLOAT,
    member_casual NVARCHAR(50)
);
GO
