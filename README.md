# Cyclistic Bike-Share Case Study

<p align="center">
  <img src="https://github.com/san03111/Cyclistic_bikeshare_2024/blob/b087af4f05587261f6f6482fed4c21cca4726f64/Cyclistic-bikeshare.png" alt="Cyclistic Bike-Share" />
</p>

## Scenario

This case study is about Cyclistic, a fictional bike-share company that provides bicycles to customers through single rides, full day passes or annual subscriptions. The director of marketing believes that for the company to grow an increase in the number of annual members is required, for which the marketing team has decided to come up with a strategy that will convert casual riders to annual riders. The job is to work along with the marketing team to gather information on how customers make use of their bikes differently with the purpose of identifying trends and generating insights.

## About the company 

In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown
to a fleet of 5,824 bicycles that are geotracked and locked into a network of 692 stations across
Chicago. The bikes can be unlocked from one station and returned to any other station in the
system anytime.

## ASK (STEP 1)
### Question
- How do annual members and casual riders use Cyclistic bikes differently?
- Why would casual riders buy Cyclistic annual memberships?
- How can Cyclistic use digital media to influence casual riders to become members?
    
**Business task** : Analyze trip data from the previous 12 months of Cyclistic trip data to develop strategies oriented to convert casual riders to members

**Primary stakeholders**: Lily Moreno, The director of marketing and the executive team.

**Secondary stakeholders**: The marketing analytics team

## PREPARE (Step 2)
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

## PROCESS (STEP 3)
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
## ANALYZE (STEP 4)
At this stage, the cleaned and standardized data from the Silver Layer is further transformed into the Gold Layer, which serves as the final dataset ready for analysis.
The query below performs several important transformations:
   - Calculates trip duration (ride length) :
     
 ```sql
    DATEDIFF(MINUTE, start_time_stamp, return_time_stamp) AS duration
 ```
   - Groups trip duration into categories: 
 ```sql
    CASE 
        WHEN DATEDIFF(MINUTE, start_time_stamp, return_time_stamp) < 10 THEN 'Under 10'
        WHEN DATEDIFF(MINUTE, start_time_stamp, return_time_stamp) BETWEEN 10 AND 30 THEN '10 to 30'
        WHEN DATEDIFF(MINUTE, start_time_stamp, return_time_stamp) BETWEEN 30 AND 60 THEN '30 to 60'
        ELSE 'Over 60'
    END AS group_duration
 ```
   → This helps identify differences in ride length distributions between members and casual riders.

   - Classifies seasons based on the trip’s start month (start_month), with the following mapping:
 ```sql
CASE 
        WHEN start_month IN ('February','March','April') THEN 'Spring'
        WHEN start_month IN ('November','December','January') THEN 'Winter'
        WHEN start_month IN ('August','September','October') THEN 'Fall'
        WHEN start_month IN ('May','June','July') THEN 'Summer'
    END AS season
 ```
   → Seasonal context is critical to analyze how weather conditions influence bike usage.

   - Enriches time-based features such as trip date, weekday name, day number, and trip start/return hour.
 ```sql
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
  ```
   - Removes trip outliers by ensuring only positive-duration trips are included.
```sql
WHERE DATEDIFF(MINUTE, start_time_stamp, return_time_stamp) > 0;
```
   - Performes multiple calculation to get a better sense of the data layout :
```sql
SELECT
    MIN(duration) AS lowest_ride_length,   -- lowest ride length
    MAX(duration) AS highest_ride_length,  -- highest ride length
    AVG(CAST(duration AS FLOAT)) AS mean_ride_length  -- ride length mean
FROM gold.tripdata_year;
```

This way, the Gold dataset is not just raw trip information but is enhanced with analytical metrics that can directly answer the key business question: 
- how do annual members and casual riders use Cyclistic bikes differently?
- Why would casual riders buy Cyclistic annual memberships?
- How can Cyclistic use digital media to influence casual riders to become members?

## SHARE (STEP 5)
Tableau was used to design clear and compelling visualizations that highlight the most relevant patterns and differences between members and casual riders. These dashboards were then integrated into a PowerPoint presentation aimed at delivering actionable insights to stakeholders in an accessible and visually engaging way.

The dashboard can be downloaded by clicking on this <a href="https://public.tableau.com/app/profile/ikhsan.alwi/viz/Cyclistic_bikeshare_17573373880320/Dashboard1"> **link**<a/>.

In summary, the analysis supports the following conclusions :
- Members ride more frequently than casual riders, with 63% of trips coming from members compared to 37% from casuals.
- However, the average ride length shows the opposite pattern: members ride for 12.92 minutes on average, while casual riders average 25.63 minutes. This suggests that members tend to use bikes for shorter, more practical trips, whereas casual riders take longer rides.
- Members ride more often on weekdays (Monday through Friday), while casual riders are more active during weekends.
- Members typically ride most around 7–8 AM, with activity stabilizing afterward and peaking again at 5 PM. In contrast, casual riders start relatively low at 5 AM and steadily increase until peaking at 5 PM.
- When grouped by ride duration, members are more likely to use bikes for trips under 10 minutes, while casual riders more commonly ride between 10 and 30 minutes. Both groups show relatively low usage for trips lasting 30–60 minutes or over 60 minutes.
- Both members and casual riders share a similar seasonal pattern, with higher usage from May through October (summer and fall) and much lower activity during spring and winter.

## ACT (STEP 6)

From these findings, we can conclude that members are mostly local residents who use bikes as part of their daily routine or for commuting to work, with consistent ride durations across weekdays. On the other hand, casual riders are less frequent users, often riding bikes as a temporary mode of transportation—for example, tourists exploring the city.
there is top 3 recommendations base on this analysist
- **Target seasonal campaigns toward casual riders** – Launch promotional offers during peak tourist seasons (summer and fall) to encourage casual riders to convert to members, such as discounted short-term memberships or trial packages.
- **Enhance commuter benefits for members** – Improve services that appeal to daily commuters, like faster check-in processes, integration with public transportation, or rewards for frequent weekday rides.
- **Personalize marketing using ride behavior insights** – Use data on ride duration and time-of-day patterns to tailor marketing messages. For example, highlight cost savings for long rides when targeting casual riders, and emphasize reliability and convenience when targeting daily commuters.








