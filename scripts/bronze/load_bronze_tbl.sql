/*
===============================================================================
Bulk Insert Tripdata CSVs (Jan - Dec) into Bronze Tables
===============================================================================
    This script will:
    1. Truncate existing monthly tables in schema "bronze".
    2. Bulk insert CSV files for each month (Jan - Dec) into their respective tables.
       - Each CSV must match the table column order.
       - The source files are assumed to be located in:
         "C:\Users\PC\Documents\cyclistic_bikeshare project\datasets\"
===============================================================================
*/

-- January
TRUNCATE TABLE bronze.tripdata_jan;
BULK INSERT bronze.tripdata_jan
FROM 'C:\Users\PC\Documents\cyclistic_bikeshare project\datasets\202401-divvy-tripdata.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);

-- February
TRUNCATE TABLE bronze.tripdata_feb;
BULK INSERT bronze.tripdata_feb
FROM 'C:\Users\PC\Documents\cyclistic_bikeshare project\datasets\202402-divvy-tripdata.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);

-- March
TRUNCATE TABLE bronze.tripdata_mar;
BULK INSERT bronze.tripdata_mar
FROM 'C:\Users\PC\Documents\cyclistic_bikeshare project\datasets\202403-divvy-tripdata.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);

-- April
TRUNCATE TABLE bronze.tripdata_apr;
BULK INSERT bronze.tripdata_apr
FROM 'C:\Users\PC\Documents\cyclistic_bikeshare project\datasets\202404-divvy-tripdata.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);

-- May
TRUNCATE TABLE bronze.tripdata_may;
BULK INSERT bronze.tripdata_may
FROM 'C:\Users\PC\Documents\cyclistic_bikeshare project\datasets\202405-divvy-tripdata.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);

-- June
TRUNCATE TABLE bronze.tripdata_jun;
BULK INSERT bronze.tripdata_jun
FROM 'C:\Users\PC\Documents\cyclistic_bikeshare project\datasets\202406-divvy-tripdata.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);

-- July
TRUNCATE TABLE bronze.tripdata_jul;
BULK INSERT bronze.tripdata_jul
FROM 'C:\Users\PC\Documents\cyclistic_bikeshare project\datasets\202407-divvy-tripdata.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);

-- August
TRUNCATE TABLE bronze.tripdata_aug;
BULK INSERT bronze.tripdata_aug
FROM 'C:\Users\PC\Documents\cyclistic_bikeshare project\datasets\202408-divvy-tripdata.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);

-- September
TRUNCATE TABLE bronze.tripdata_sep;
BULK INSERT bronze.tripdata_sep
FROM 'C:\Users\PC\Documents\cyclistic_bikeshare project\datasets\202409-divvy-tripdata.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);

-- October
TRUNCATE TABLE bronze.tripdata_oct;
BULK INSERT bronze.tripdata_oct
FROM 'C:\Users\PC\Documents\cyclistic_bikeshare project\datasets\202410-divvy-tripdata.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);

-- November
TRUNCATE TABLE bronze.tripdata_nov;
BULK INSERT bronze.tripdata_nov
FROM 'C:\Users\PC\Documents\cyclistic_bikeshare project\datasets\202411-divvy-tripdata.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);

-- December
TRUNCATE TABLE bronze.tripdata_dec;
BULK INSERT bronze.tripdata_dec
FROM 'C:\Users\PC\Documents\cyclistic_bikeshare project\datasets\202412-divvy-tripdata.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);
