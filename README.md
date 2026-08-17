# 📺 BrightTV Viewership Analytics
  ## Loveable Dashboard:
  https://tvmetrics-hq.lovable.app
## Overview

This project presents a complete end-to-end data analytics solution for the **BrightTV Viewership Analytics Case Study**. The objective is to analyze subscriber viewing behaviour, identify factors that influence content consumption, and provide strategic recommendations to help BrightTV grow its subscriber base.

The project demonstrates the complete data analytics lifecycle, from raw data ingestion and cleaning to SQL analysis, dashboard development, business insights, and executive presentation.

---

# Business Problem

BrightTV's CEO aims to increase the company's subscription base during the current financial year. The Customer Value Management (CVM) team requires data-driven insights to better understand subscriber behaviour and improve customer engagement.

The project answers the following business questions:

- What are the current user and viewing trends?
- Which factors influence content consumption?
- What content should be promoted during periods of low viewership?
- Which initiatives can help increase BrightTV's subscriber base?

---

# Project Objectives

The objectives of this project are to:

- Clean and prepare the raw BrightTV datasets.
- Create a structured analytical dataset using SQL.
- Explore customer demographics and viewing behaviour.
- Identify patterns in subscriber engagement.
- Measure content consumption across different periods.
- Build interactive dashboards for executive reporting.
- Provide strategic business recommendations.
- Present findings in a professional executive presentation.

---

# Dataset Description

The project uses two datasets supplied by BrightTV.

## 1. User Profiles

Contains subscriber demographic information including:

- User ID
- Age
- Gender
- Province
- Race
- Email Address
- Social Media Handle

## 2. Viewership Data

Contains viewing session information including:

- User ID
- Viewing Date
- Viewing Time
- Channel
- Viewing Duration

Each row represents one viewing session for one subscriber.

---

# Project Workflow

The project follows the standard Data Analytics lifecycle.

```
Business Understanding
        │
        ▼
Data Collection
        │
        ▼
Data Cleaning
        │
        ▼
Feature Engineering
        │
        ▼
SQL Analysis
        │
        ▼
Data Validation
        │
        ▼
Excel Analysis
        │
        ▼
Dashboard Development
        │
        ▼
Business Insights
        │
        ▼
Recommendations
        │
        ▼
Executive Presentation
```

---

# Data Cleaning

The following data quality issues were addressed:

### User Profiles

- Removed duplicate users
- Standardized gender values
- Standardized race values
- Cleaned province names
- Handled missing values
- Categorized ages into age groups
- Created Email Availability flag
- Created Social Media Availability flag

### Viewership Data

- Removed inconsistencies
- Standardized channel names
- Converted UTC timestamps to South African Standard Time (SAST)
- Created viewing time buckets
- Classified weekday and weekend viewing
- Created screen time categories

---

# Feature Engineering

Several analytical features were created to improve reporting.

These include:

- Age Group
- Region
- Month
- Month Name
- Day Name
- Weekday / Weekend Classification
- Hour of Day
- Time of Day
- Screen Time Bucket
- Email Flag
- Social Media Flag
- TV Channel Category

---

# SQL Analysis

Databricks SQL was used to perform:

- Exploratory Data Analysis
- Data Cleaning
- Data Transformation
- Feature Engineering
- Table Joins
- Data Validation
- Final Analytical Dataset Creation

---

# Excel Analysis

Microsoft Excel was used to create:

- Pivot Tables
- Pivot Charts
- KPI Calculations
- Interactive Dashboard
- Executive Summary Tables

Key analyses include:

- Users by Province
- Users by Gender
- Users by Age Group
- Users by Race
- Viewing Sessions by Month
- Viewing Sessions by Weekday
- Viewing Sessions by Time of Day
- Most Watched Channels
- Screen Time Distribution
- Regional Consumption Trends

---

# Dashboard

The dashboard provides an executive overview of:

- Total Subscribers
- Total Viewing Sessions
- Average Viewing Duration
- Popular Channels
- Peak Viewing Times
- Screen Time Distribution
- Regional Performance
- Demographic Trends

---

# Business Insights

The analysis provides insights into:

- Subscriber demographics
- Regional viewing behaviour
- Viewing habits
- High-engagement periods
- Low-engagement periods
- Popular content categories
- Customer engagement levels
- Marketing opportunities

---

# Recommendations

Based on the analysis, the following recommendations were developed:

### Increase Content Consumption

- Promote premium content during low-viewership periods.
- Schedule exclusive releases during weekdays.
- Increase local content.
- Introduce family entertainment packages.
- Personalize content recommendations.

### Increase Subscriber Base

- Launch referral programmes.
- Introduce student subscription packages.
- Create loyalty rewards.
- Offer free trial campaigns.
- Develop regional marketing campaigns.
- Partner with mobile network providers.

---

# Technologies Used

| Tool | Purpose |
|-------|---------|
| Databricks SQL | Data Cleaning, Processing and Analysis |
| SQL | Data Transformation |
| Microsoft Excel | Pivot Tables, Charts and Dashboard |
| PowerPoint | Executive Presentation |
| Miro | Project Planning and Flowchart |
| Git & GitHub | Version Control and Repository |
| Markdown | Project Documentation |

---

# Repository Structure

```
BrightTV-Viewership-Analytics
│
├── README.md
├── Project Description
├── Raw Data
├── Project Planning
│     ├── Miro Flowchart
│     └── Gantt Chart
├── SQL
├── Processed Data
├── Excel Analysis
├── Dashboard
├── Presentation
└── Images
```

---

# Deliverables

This repository contains:

- Project Description
- Raw Dataset
- SQL Code
- Processed Dataset
- Excel Analysis
- Dashboard
- Executive Presentation
- Miro Flowchart
- Project Gantt Chart
- Business Recommendations
- Project Documentation

---

# Skills Demonstrated

- Data Cleaning
- Data Wrangling
- SQL Development
- Data Validation
- Feature Engineering
- Business Intelligence
- Dashboard Development
- Data Visualization
- Business Analysis
- Executive Reporting
- Problem Solving
- Critical Thinking

---

# Key Outcomes

This project demonstrates how data analytics can be used to transform raw viewing data into actionable business insights that support strategic decision-making.

The final solution enables BrightTV management to:

- Better understand subscriber behaviour.
- Improve customer engagement.
- Increase viewing activity.
- Develop targeted marketing campaigns.
- Enhance customer retention.
- Grow the company's subscription base through data-driven decision-making.

---

# Author

**Sinazo Bhokiya**
https://tvmetrics-hq.lovable.app

Geology Graduate | Data Analytics Enthusiast | Aspiring Data Scientist

This project was completed as part of the **BrightLearn Data Analytics Programme** and showcases practical skills in SQL, Excel, business intelligence, and analytical storytelling.

---
