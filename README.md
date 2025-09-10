# Cyclistic Bike-Share Case Study

## Scenario

This case study is about Cyclistic, a fictional bike-share company that provides bicycles to customers through single rides, full day passes or annual subscriptions. The director of marketing believes that for the company to grow an increase in the number of annual members is required, for which the marketing team has decided to come up with a strategy that will convert casual riders to annual riders. The job is to work along with the marketing team to gather information on how customers make use of their bikes differently with the purpose of identifying trends and generating insights.

## About the company 

In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown
to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across
Chicago. The bikes can be unlocked from one station and returned to any other station in the
system anytime.

### ASK (Step 1)
#### Question
- How do annual members and casual riders use Cyclistic bikes differently?
- Why would casual riders buy Cyclistic annual memberships?
- How can Cyclistic use digital media to influence casual riders to become members?
    
- **Business task** : Analyze trip data from the previous 12 months of Cyclistic trip data to develop strategies oriented to convert casual riders to members
- **Primary stakeholders**: Lilt Moreno, The director of marketing and the executive team.
- **Secondary stakeholders**: The marketing analytics team

### Prepare (Step 2)
The dataset used in this project is the previous 12 months trip data provided by <a href="https://divvy-tripdata.s3.amazonaws.com/index.html"> **Divvy Tripdata**<a/>. It consists of 12 comma-separated value (CSV) files, each representing one month of Cyclistic bike rides throughout the year 2024.

Since the dataset is relatively large, SQL Server was used for data loading and processing. To ensure a structured and scalable workflow, the Bronze, Silver, and Gold schema approach was applied, consisting of three stages of data preparation:

 1. Bronze Layer – Raw data ingestion.
    - All 12 monthly CSV files are loaded into SQL Server without significant transformations.
    - This step ensures that the original dataset is preserved for reference.
 2. Silver Layer - Data cleaning and transformation.
    - Unnecessary characters (e.g., quotes ") are removed.
    - Data types are standardized (e.g., timestamps cast into DATETIME2).
    - Errors and inconsistencies are handled to prepare for analysis.
 2. Gold Layer – Final analytical model.
    - Data from the Silver layer is aggregated and enriched with calculated fields such as trip duration, duration grouping, season classification, and time-based breakdown (day, month, hour).
    - This final table is used directly for analysis and visualization in Tableau.

First we need to create a new database for this project called **cyclistic_bikeshare** with this following code : 
<a href=https://github.com/san03111/Cyclistic_bikeshare_2024/blob/main/scripts/crt_database.sql>**Create Database**<a/>

<pre> ```sql 
    
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

``` </pre>

Next, we create new tables for each month (e.g., bronze.tripdata_jan):

<pre> ```sql 

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
    
``` </pre> 
**Repeate for each months until december**







### Dashbord
<a href="https://public.tableau.com/app/profile/ikhsan.alwi/viz/Cyclistic_bikeshare_17573373880320/Dashboard1"> **Tableau**
