/*
===============================================================================
Create Silver Monthly Tables (Jan - Dec)
===============================================================================
    This script will:
    1. Drop existing monthly tables in schema "silver" if they already exist.
    2. Re-create each table with a cleaned structure:
        - member_casual   (NVARCHAR 50)
        - rideable_type   (NVARCHAR 50)
        - started_at      (DATETIME2(3))
        - ended_at        (DATETIME2(3))
    These tables are simplified versions of the bronze raw tables, intended
    for cleaned, standardized data and delete outlier.
===============================================================================
*/

-- January
IF OBJECT_ID('silver.tripdata_jan', 'U') IS NOT NULL
    DROP TABLE silver.tripdata_jan;
CREATE TABLE silver.tripdata_jan (
    member_casual NVARCHAR(50),
    rideable_type NVARCHAR(50),
    started_at DATETIME2(3),
    ended_at DATETIME2(3)
);

-- February
IF OBJECT_ID('silver.tripdata_feb', 'U') IS NOT NULL
    DROP TABLE silver.tripdata_feb;
CREATE TABLE silver.tripdata_feb (
    member_casual NVARCHAR(50),
    rideable_type NVARCHAR(50),
    started_at DATETIME2(3),
    ended_at DATETIME2(3)
);

-- March
IF OBJECT_ID('silver.tripdata_mar', 'U') IS NOT NULL
    DROP TABLE silver.tripdata_mar;
CREATE TABLE silver.tripdata_mar (
    member_casual NVARCHAR(50),
    rideable_type NVARCHAR(50),
    started_at DATETIME2(3),
    ended_at DATETIME2(3)
);

-- April
IF OBJECT_ID('silver.tripdata_apr', 'U') IS NOT NULL
    DROP TABLE silver.tripdata_apr;
CREATE TABLE silver.tripdata_apr (
    member_casual NVARCHAR(50),
    rideable_type NVARCHAR(50),
    started_at DATETIME2(3),
    ended_at DATETIME2(3)
);

-- May
IF OBJECT_ID('silver.tripdata_may', 'U') IS NOT NULL
    DROP TABLE silver.tripdata_may;
CREATE TABLE silver.tripdata_may (
    member_casual NVARCHAR(50),
    rideable_type NVARCHAR(50),
    started_at DATETIME2(3),
    ended_at DATETIME2(3)
);

-- June
IF OBJECT_ID('silver.tripdata_jun', 'U') IS NOT NULL
    DROP TABLE silver.tripdata_jun;
CREATE TABLE silver.tripdata_jun (
    member_casual NVARCHAR(50),
    rideable_type NVARCHAR(50),
    started_at DATETIME2(3),
    ended_at DATETIME2(3)
);

-- July
IF OBJECT_ID('silver.tripdata_jul', 'U') IS NOT NULL
    DROP TABLE silver.tripdata_jul;
CREATE TABLE silver.tripdata_jul (
    member_casual NVARCHAR(50),
    rideable_type NVARCHAR(50),
    started_at DATETIME2(3),
    ended_at DATETIME2(3)
);

-- August
IF OBJECT_ID('silver.tripdata_aug', 'U') IS NOT NULL
    DROP TABLE silver.tripdata_aug;
CREATE TABLE silver.tripdata_aug (
    member_casual NVARCHAR(50),
    rideable_type NVARCHAR(50),
    started_at DATETIME2(3),
    ended_at DATETIME2(3)
);

-- September
IF OBJECT_ID('silver.tripdata_sep', 'U') IS NOT NULL
    DROP TABLE silver.tripdata_sep;
CREATE TABLE silver.tripdata_sep (
    member_casual NVARCHAR(50),
    rideable_type NVARCHAR(50),
    started_at DATETIME2(3),
    ended_at DATETIME2(3)
);

-- October
IF OBJECT_ID('silver.tripdata_oct', 'U') IS NOT NULL
    DROP TABLE silver.tripdata_oct;
CREATE TABLE silver.tripdata_oct (
    member_casual NVARCHAR(50),
    rideable_type NVARCHAR(50),
    started_at DATETIME2(3),
    ended_at DATETIME2(3)
);

-- November
IF OBJECT_ID('silver.tripdata_nov', 'U') IS NOT NULL
    DROP TABLE silver.tripdata_nov;
CREATE TABLE silver.tripdata_nov (
    member_casual NVARCHAR(50),
    rideable_type NVARCHAR(50),
    started_at DATETIME2(3),
    ended_at DATETIME2(3)
);

-- December
IF OBJECT_ID('silver.tripdata_dec', 'U') IS NOT NULL
    DROP TABLE silver.tripdata_dec;
CREATE TABLE silver.tripdata_dec (
    member_casual NVARCHAR(50),
    rideable_type NVARCHAR(50),
    started_at DATETIME2(3),
    ended_at DATETIME2(3)
);
