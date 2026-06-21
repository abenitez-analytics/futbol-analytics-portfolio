# ⚽ La Liga Player Performance & Scouting Dashboard

## Project Overview

This project analyzes player performance using StatsBomb event-level data from 100 La Liga matches.

The objective was to simulate the workflow of a Football Data Analyst working for a professional club, transforming raw event data into actionable scouting insights through Python, SQL, and Power BI.

---

## Business Problem

Football clubs need objective ways to identify players who:

* Generate attacking value
* Contribute defensively
* Fit specific tactical profiles
* Represent potential recruitment opportunities

This project demonstrates how event data can be transformed into performance indicators and scouting reports.

---

## Dataset

Source: StatsBomb Open Data

Scope:

* Competition: La Liga
* Matches analyzed: 100
* Events analyzed: 340,199
* Players analyzed: 367

---

## Tech Stack

### Python

* Pandas
* NumPy
* StatsBombPy
* Matplotlib
* mplsoccer

### SQL

* Data exploration
* Player ranking queries
* Scouting shortlist creation

### Power BI

* KPI dashboard
* Player rankings
* Scouting visualizations

---

## Project Workflow

### 1. Data Collection

Downloaded event-level football data using StatsBombPy.

### 2. Data Cleaning

Processed and structured raw event data into analytical datasets.

### 3. Feature Engineering

Created player-level metrics including:

* Passes
* Shots
* Expected Goals (xG)
* Pressures
* Recoveries
* xG per 90
* Shots per 90
* Pressures per 90
* Attacking Score

### 4. Scouting Analysis

Built player rankings and scouting shortlists using custom performance metrics.

### 5. Dashboard Development

Created an interactive Power BI dashboard for player evaluation.

---

## Key Metrics

| Metric            | Description                              |
| ----------------- | ---------------------------------------- |
| xG                | Expected Goals                           |
| xG per 90         | Expected Goals normalized per 90 minutes |
| Shots per 90      | Shot volume                              |
| Pressures per 90  | Defensive intensity                      |
| Recoveries per 90 | Ball-winning contribution                |
| Attacking Score   | Composite attacking performance metric   |

---

## Visualizations

### Shot Map

Player shot locations and xG values.

### Pass Map

Passing behavior and distribution.

### Scouting Map

Relationship between attacking production and defensive intensity.

---

## SQL Analysis

Included SQL queries:

* Top Attackers
* Top Pressers
* Scouting Shortlist

---

## Dashboard

The Power BI dashboard includes:

* Player Overview
* Attacking Analysis
* Defensive Analysis
* Scouting Shortlist

---

## Key Findings

* Event data provides a detailed view of player performance beyond goals and assists.
* xG and pressure metrics help identify players who contribute both offensively and defensively.
* Scouting profiles can be created using simple but effective analytical frameworks.

---

## Future Improvements

* Full-season analysis
* Pass networks
* Team style analysis
* Radar charts
* Predictive models
* Automated ETL pipeline

---

## Author

Andres Benitez

Football Analytics Portfolio Project
Python | SQL | Power BI | StatsBomb

