-- Databricks notebook source
-------------------------------------------------------------------------------------------------------------------------------------------------------
--- Set the working catalog and schema
USE bright_tv.data;

--------------------------------------------------------------------------------------------------------------------------------------------------------

--- Preview the user profiles table
SELECT * 
FROM bright_tv.data.user_profiles;

--- Preview the viewerships table
SELECT *
FROM bright_tv.data.viewerships;
--------------------------------------------------------------------------------------------------------------------------------------------------

--- Create a temporary table with cleaned user profile data

CREATE OR REPLACE TEMPORARY TABLE user_profiles AS (

SELECT UserID,

--- -- Clean and standardize Province names
      CASE
         WHEN Province = ' ' THEN 'Uncategorized'
         WHEN Province = 'None' THEN 'Uncategorized'
     ELSE Province
     END AS Region,

     Age,

--- Group users into Age categories
     CASE
        WHEN Age = 0 THEN 'Infants'
        WHEN Age BETWEEN 1 AND 12 THEN 'Kids'
        WHEN Age BETWEEN 13 AND 19 THEN 'Teenager'
        WHEN Age BETWEEN 20 AND 35 THEN 'Youth'
        WHEN Age BETWEEN 36 AND 50 THEN 'Adult'
        WHEN Age BETWEEN 51 AND 65 THEN 'Elder'
        WHEN Age > 65 THEN 'Pensioner'
    END AS age_groups,


--- Create an Email availability flag
    CASE
       WHEN (Email IS NOT NULL) OR (Email = ' ') OR (EMAIL NOT IN ('None')) THEN 1
       ELSE 0
    END AS email_flag,

    CASE
      WHEN `Social Media Handle` IS NOT NULL OR `Social Media Handle` = ' ' OR `Social Media Handle` NOT IN ('None') THEN 1
    ELSE 0
   END AS sm_flag,

--- Standardize Race values
   CASE
     WHEN Race = 'Other' THEN 'None'
     WHEN Race = ' ' THEN 'None'
   ELSE Race
  END AS Race,

--- Standardize gender values
  CASE
    WHEN Gender = ' ' THEN 'None'
    ELSE Gender
  END AS Gender

FROM bright_tv.data.user_profiles);


--- Display the cleaned user profile table
SELECT *
FROM user_profiles;

---------------------------------------------------------------------------------------------------------------------------------------------------

--- Create a temporary table with cleaned viewership data
CREATE OR REPLACE TEMPORARY TABLE viewership AS (

SELECT
   COALESCE(UserID0,userid4) AS userid, --- Combine user IDs from both columns
   TO_CHAR(RecordDate2, 'yyyyMM') AS month_id, --- Create a month identifier
   TO_DATE(RecordDate2) AS watch_date, --- Extract the viewing date
   TO_CHAR(RecordDate2, 'DD') AS day_of_month, --- Extract the day of the month
   DAYNAME(RecordDate2) AS day_name, --- Extract the day name

--- Classify weekdays and weekends
   CASE
      WHEN DAYNAME(RecordDate2) IN ('Sat', 'Sun') THEN 'Weekend'
      ELSE 'Weekday'
     END AS day_classification,

     MONTHNAME(RecordDate2) AS month_name, --- Extract the month name


--- Standardize channel names
  CASE
    WHEN Channel2 IN ('SawSee', 'Sawsee') THEN 'SawSee'
    WHEN Channel2 IN ('SuperSport Live Events', 'Live on SuperSport', 'Supersport Live Events', 'DStv Events 1') THEN 'Live Events'
    ELSE Channel2
   END AS Tv_channel,

    DATE_FORMAT(RecordDate2, 'HH:mm:ss') AS watch_time, --- Extract the viewing time


 --- Categorize viewing time into periods   
    CASE 
        WHEN watch_time BETWEEN '00:00:00' AND '05:59:59' THEN '01. Midnight' 
        WHEN watch_time BETWEEN '06:00:00' AND '11:59:59' THEN '02. Morning' 
        WHEN watch_time BETWEEN '12:00:00' AND '16:59:59' THEN '03. Afternoon' 
        WHEN watch_time BETWEEN '17:00:00' AND '23:59:59' THEN '04. Evening' 
    END AS time_of_day, 
 
    DATE_FORMAT(`Duration 2`, 'HH:mm:ss') AS duration, --- Format the viewing duration

--- Group users by screen time
    CASE  
        WHEN duration BETWEEN '00:05:00' AND '00:30:00' THEN '01. Low Usage: <30 min' 
        WHEN duration BETWEEN '00:30:01' AND '00:59:59' THEN '02. Med Usage: <60 min' 
        WHEN duration > '00:59:59' THEN '03. High Usage: >60 min' 
        ELSE '04. No Usage' 
    END AS screen_time_bucket, 

HOUR(RecordDate2) AS hour_of_day --- Extract the viewing hour

FROM bright_tv.data.viewerships);

--- Display the cleaned viewership table
SELECT *
FROM viewership;


--- Join the cleaned user profiles and viewership data

SELECT Coalesce(A.userid,B.userid) AS sub_id, --- Create a single subscriber ID
       month_id, 
       watch_date, 
       day_of_month, 
       day_name, 
       day_classification, 
       month_name, 
       Tv_channel, 
       time_of_day, 
       hour_of_day, 
       screen_time_bucket, 
       --user_flag, 
       duration, 
       Region, 
       age_groups, 
       email_flag, 
       sm_flag, 
       Race, 
       Gender 

FROM viewership AS A 
LEFT JOIN user_profiles AS B --- Join matching user records
ON A.userid=B.userid; 
