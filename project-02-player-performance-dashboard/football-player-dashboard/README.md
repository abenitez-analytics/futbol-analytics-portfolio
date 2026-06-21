⚽ Project 02 – Player Performance Dashboard
Overview

This project simulates the workflow of a professional football data analyst working for a club recruitment and performance department.

Using StatsBomb event data from La Liga, player-level performance metrics were calculated, normalized per 90 minutes, and transformed into scouting insights.

The project combines:

Python
Pandas
StatsBomb API
SQL
Data Visualization
Power BI
Objectives
Collect football event data from StatsBomb
Build player performance metrics
Normalize statistics per 90 minutes
Identify top attacking players
Create a scouting shortlist
Produce visualizations and dashboards
Dataset

Source:

StatsBomb Open Data

Competition:

La Liga

Season:

2015/2016
Project Structure

project-02-player-performance-dashboard/

├── data/
│ ├── raw/
│ └── cleaned/

├── notebooks/
│ ├── 01_data_exploration.ipynb
│ ├── 02_data_collection.ipynb
│ ├── 03_player_analysis.ipynb
│ └── 04_scouting_analysis.ipynb

├── scripts/
│ └── build_player_dataset.py

├── sql/
│ ├── create_tables.sql
│ └── analysis_queries.sql

├── visuals/

├── powerbi/

├── README.md

└── requirements.txt

Key Metrics
Expected Goals (xG)
xG per 90
Shots per 90
Passes
Pressures
Ball Recoveries
Visualizations

Included:

Shot Map
Pass Map
Scouting Scatter Plot
Player Performance Overview
Skills Demonstrated
Python
Data Cleaning
Feature Engineering
Aggregations
Visualization
SQL
Table Creation
Aggregation Queries
Scouting Queries
Football Analytics
Event Data Analysis
Player Evaluation
Scouting Methodology
Future Improvements
Interactive Power BI Dashboard
Player Radar Charts
Position-Based Comparisons
Recruitment Models
