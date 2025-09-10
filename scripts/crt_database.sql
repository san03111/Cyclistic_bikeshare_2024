/*
===============================================================================
Create new database and schemas
===============================================================================
    This script will create a new database called "cyclistic_bikeshare". 
    - If the database already exists, it will be dropped first (⚠ all data will be lost).
    - After creating the database, the script sets up three schemas:
        1. bronze  -> raw ingested data (unprocessed)
        2. silver  -> cleaned and standardized data
        3. gold    -> business-ready, aggregated, analytics data
===============================================================================
*/

USE master;
GO

-- Drop database "cyclistic_bikeshare" IF it already exists
IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'cyclistic_bikeshare')
BEGIN 
    ALTER DATABASE cyclistic_bikeshare SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE cyclistic_bikeshare;
END;
GO

-- Create the new "cyclistic_bikeshare" database
CREATE DATABASE cyclistic_bikeshare;
GO

-- Switch context to the new database
USE cyclistic_bikeshare;
GO

-- Create schemas to organize data pipelines
CREATE SCHEMA bronze;
GO

CREATE SCHEMA silver;
GO

CREATE SCHEMA gold;
GO
