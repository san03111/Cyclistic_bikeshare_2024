/*
===============================================================================
Transform Bronze to Silver Tables (Jan - Dec)
===============================================================================
    This script will:
    1. Insert data from bronze monthly tables into their silver counterparts.
    2. Clean the raw data by:
        - Removing extra quotes (") from text fields.
        - Casting datetime strings into DATETIME2(3).
    3. Silver tables have a simplified schema:
        - member_casual
        - rideable_type
        - started_at
        - ended_at
===============================================================================
*/

-- January
INSERT INTO silver.tripdata_jan (
    member_casual,
    rideable_type,
    started_at,
    ended_at
)
SELECT
    REPLACE(member_casual, '"', '') AS member_casual,
    REPLACE(rideable_type, '"', '') AS rideable_type,
    CAST(REPLACE(startet_at, '"', '') AS DATETIME2(3)) AS started_at,
    CAST(REPLACE(ended_at, '"', '') AS DATETIME2(3)) AS ended_at
FROM bronze.tripdata_jan;

-- February
INSERT INTO silver.tripdata_feb (
    member_casual,
    rideable_type,
    started_at,
    ended_at
)
SELECT
    REPLACE(member_casual, '"', ''),
    REPLACE(rideable_type, '"', ''),
    CAST(REPLACE(startet_at, '"', '') AS DATETIME2(3)),
    CAST(REPLACE(ended_at, '"', '') AS DATETIME2(3))
FROM bronze.tripdata_feb;

-- March
INSERT INTO silver.tripdata_mar (
    member_casual,
    rideable_type,
    started_at,
    ended_at
)
SELECT
    REPLACE(member_casual, '"', ''),
    REPLACE(rideable_type, '"', ''),
    CAST(REPLACE(startet_at, '"', '') AS DATETIME2(3)),
    CAST(REPLACE(ended_at, '"', '') AS DATETIME2(3))
FROM bronze.tripdata_mar;

-- April
INSERT INTO silver.tripdata_apr (
    member_casual,
    rideable_type,
    started_at,
    ended_at
)
SELECT
    REPLACE(member_casual, '"', ''),
    REPLACE(rideable_type, '"', ''),
    CAST(REPLACE(startet_at, '"', '') AS DATETIME2(3)),
    CAST(REPLACE(ended_at, '"', '') AS DATETIME2(3))
FROM bronze.tripdata_apr;

-- May
INSERT INTO silver.tripdata_may (
    member_casual,
    rideable_type,
    started_at,
    ended_at
)
SELECT
    REPLACE(member_casual, '"', ''),
    REPLACE(rideable_type, '"', ''),
    CAST(REPLACE(startet_at, '"', '') AS DATETIME2(3)),
    CAST(REPLACE(ended_at, '"', '') AS DATETIME2(3))
FROM bronze.tripdata_may;

-- June
INSERT INTO silver.tripdata_jun (
    member_casual,
    rideable_type,
    started_at,
    ended_at
)
SELECT
    REPLACE(member_casual, '"', ''),
    REPLACE(rideable_type, '"', ''),
    CAST(REPLACE(startet_at, '"', '') AS DATETIME2(3)),
    CAST(REPLACE(ended_at, '"', '') AS DATETIME2(3))
FROM bronze.tripdata_jun;

-- July
INSERT INTO silver.tripdata_jul (
    member_casual,
    rideable_type,
    started_at,
    ended_at
)
SELECT
    REPLACE(member_casual, '"', ''),
    REPLACE(rideable_type, '"', ''),
    CAST(REPLACE(startet_at, '"', '') AS DATETIME2(3)),
    CAST(REPLACE(ended_at, '"', '') AS DATETIME2(3))
FROM bronze.tripdata_jul;

-- August
INSERT INTO silver.tripdata_aug (
    member_casual,
    rideable_type,
    started_at,
    ended_at
)
SELECT
    REPLACE(member_casual, '"', ''),
    REPLACE(rideable_type, '"', ''),
    CAST(REPLACE(startet_at, '"', '') AS DATETIME2(3)),
    CAST(REPLACE(ended_at, '"', '') AS DATETIME2(3))
FROM bronze.tripdata_aug;

-- September
INSERT INTO silver.tripdata_sep (
    member_casual,
    rideable_type,
    started_at,
    ended_at
)
SELECT
    REPLACE(member_casual, '"', ''),
    REPLACE(rideable_type, '"', ''),
    CAST(REPLACE(startet_at, '"', '') AS DATETIME2(3)),
    CAST(REPLACE(ended_at, '"', '') AS DATETIME2(3))
FROM bronze.tripdata_sep;

-- October
INSERT INTO silver.tripdata_oct (
    member_casual,
    rideable_type,
    started_at,
    ended_at
)
SELECT
    REPLACE(member_casual, '"', ''),
    REPLACE(rideable_type, '"', ''),
    CAST(REPLACE(startet_at, '"', '') AS DATETIME2(3)),
    CAST(REPLACE(ended_at, '"', '') AS DATETIME2(3))
FROM bronze.tripdata_oct;

-- November
INSERT INTO silver.tripdata_nov (
    member_casual,
    rideable_type,
    started_at,
    ended_at
)
SELECT
    REPLACE(member_casual, '"', ''),
    REPLACE(rideable_type, '"', ''),
    CAST(REPLACE(startet_at, '"', '') AS DATETIME2(3)),
    CAST(REPLACE(ended_at, '"', '') AS DATETIME2(3))
FROM bronze.tripdata_nov;

-- December
INSERT INTO silver.tripdata_dec (
    member_casual,
    rideable_type,
    started_at,
    ended_at
)
SELECT
    REPLACE(member_casual, '"', ''),
    REPLACE(rideable_type, '"', ''),
    CAST(REPLACE(startet_at, '"', '') AS DATETIME2(3)),
    CAST(REPLACE(ended_at, '"', '') AS DATETIME2(3))
FROM bronze.tripdata_dec;
