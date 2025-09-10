# Cyclistic Bike-Share Case Study

## Scenario

This case study is about Cyclistic, a fictional bike-share company that provides bicycles to customers through single rides, full day passes or annual subscriptions. The director of marketing believes that for the company to grow an increase in the number of annual members is required, for which the marketing team has decided to come up with a strategy that will convert casual riders to annual riders. The job is to work along with the marketing team to gather information on how customers make use of their bikes differently with the purpose of identifying trends and generating insights.

## About the company 

In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown
to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across
Chicago. The bikes can be unlocked from one station and returned to any other station in the
system anytime.

### ASK (STEP 1)
#### Question
- How do annual members and casual riders use Cyclistic bikes differently?
- Why would casual riders buy Cyclistic annual memberships?
- How can Cyclistic use digital media to influence casual riders to become members?
    
**Business task** : Analyze trip data from the previous 12 months of Cyclistic trip data to develop strategies oriented to convert casual riders to members

**Primary stakeholders**: Lily Moreno, The director of marketing and the executive team.

**Secondary stakeholders**: The marketing analytics team

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

```sql 
CREATE DATABASE cyclistic_bikeshare;
GO
``` 

Next, we create new tables for each month (e.g., bronze.tripdata_jan):

```sql
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
```
**Repeate the same step for each months until december**, you can see the full script <a href=https://github.com/san03111/Cyclistic_bikeshare_2024/blob/main/scripts/bronze/crt_bronze_tbl.sql>**here**</a> 

After creating the tables in the Bronze layer, the next step is to load the raw data from the 12 CSV files (January–December) into their corresponding tables. Since each CSV contains thousand of rows, we use the BULK INSERT command in SQL Server to efficiently load the files

```sql
-- January
TRUNCATE TABLE bronze.tripdata_jan;
BULK INSERT bronze.tripdata_jan
FROM 'C:\Users\PC\Documents\cyclistic_bikeshare project\datasets\202401-divvy-tripdata.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    TABLOCK
);
```
**Repeate the same step for each months until december**.
This process ensures all the raw data is ingested into the Bronze schema before moving to the transformation stage in the Silver layer. you can see the full script for bulk insert <a href=https://github.com/san03111/Cyclistic_bikeshare_2024/blob/main/scripts/bronze/load_bronze_tbl.sql>**here**</a> 

After loading all the data into the database, the *R.O.C.C.C.* method was applied to evaluate the credibility of the dataset:
- **Reliable** – Data was provided by *Motivate International Inc*. under this <a href=https://divvybikes.com/data-license-agreement>**license**<a/>.
- **Original** – The source of the data is the City of Chicago’s Divvy bike-sharing service.
- **Comprehensive** – The dataset includes all the necessary information to address the business task.
- **Current** – The data was less than one year old at the time of this analysis.
- **Cited** – The dataset is publicly available <a href="https://divvy-tripdata.s3.amazonaws.com/index.html">here<a/>.

### Process (STEP 3)
At this stage, the raw data in the Bronze layer was not yet ready for analysis due to formatting issues, inconsistent data types, and the presence of outliers. Therefore, several transformations and cleaning steps were applied to prepare the data for further analysis.

The following steps were taken in order to ensure data was clean and ready for analysis:

The first step was to remove unnecessary quotation marks that appeared after the bulk insert process from CSV files. Next, the columns started_at and ended_at were converted from text into DATETIME2(3) format so that the data could be used for proper time-based calculations :
```sql
SELECT
    REPLACE(member_casual, '"', '') AS member_casual,
    REPLACE(rideable_type, '"', '') AS rideable_type,
    CAST(REPLACE(startet_at, '"', '') AS DATETIME2(3)) AS started_at,
    CAST(REPLACE(ended_at, '"', '') AS DATETIME2(3)) AS ended_at
FROM bronze.tripdata_jan
```
Next, delete unnecessary columns and outliers from the database to focus only on the variables required for the analysis. Since the business question is to understand how annual members and casual riders use Cyclistic bikes differently, we only needed information about membership type, bike type, and trip duration (from started_at and ended_at). 

Therefore, columns such as station name, station ID, latitude, and longitude were excluded. At the same time, trips with invalid records (e.g., missing values, zero or negative duration, or extremely long rides) were removed to maintain data quality.
The cleaned and filtered data was then inserted into the Silver tables using the following query:
```sql

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
FROM bronze.tripdata_jan
```
After cleaning each monthly dataset in the Silver layer, the next step was to combine all months into a single table to make the analysis more efficient. Instead of querying each month separately, the 12 monthly tables were unioned together into silver.tripdata_year.
This allows us to work with the entire year’s dataset at once and simplifies the process of generating insights
The following query demonstrates how the monthly Silver tables were combined:
```sql

CREATE TABLE silver.tripdata_year (
    member_casual NVARCHAR(50),
    rideable_type NVARCHAR(50),
    started_at DATETIME2(3),
    ended_at DATETIME2(3)
);
INSERT INTO silver.tripdata_year
SELECT * FROM silver.tripdata_jan
UNION ALL
SELECT * FROM silver.tripdata_feb
UNION ALL
...
UNION ALL
SELECT * FROM silver.tripdata_dec
```
### Analyze (STEP 4)









### Dashbord
<a href="https://public.tableau.com/app/profile/ikhsan.alwi/viz/Cyclistic_bikeshare_17573373880320/Dashboard1"> **Tableau**
