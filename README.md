# 🌍 World Life Expectancy — SQL Data Analysis

## 📌 Project Overview

This project analyzes World Life Expectancy data using MySQL.

The project follows a complete SQL-based analytical workflow:

**Data Cleaning → Exploratory Data Analysis → Insights**

The analysis explores Life Expectancy across countries and years, with additional investigation into GDP, development status, BMI, Adult Mortality and Infant Deaths.

---

## 🎯 Project Objective

The objective of this project is to use SQL to clean and analyze World Life Expectancy data and answer analytical questions such as:

- Which countries experienced the largest changes in Life Expectancy?
- How does Life Expectancy differ between Developed and Developing countries?
- How does Life Expectancy differ across GDP groups?
- What patterns can be observed in Adult Mortality and Infant Deaths?
- How have key indicators changed for India over time?

---

## 🗂️ Dataset

**Dataset:** World Life Expectancy

**Period:** 2007–2022

**Countries:** 193

**Records:** 2,941

### Key Variables

| Variable | Description |
|---|---|
| Country | Country name |
| Year | Observation year |
| Life Expectancy | Average expected years of life |
| Status | Developed / Developing |
| GDP | GDP per capita |
| BMI | Average Body Mass Index |
| Adult Mortality | Adult mortality indicator |
| Infant Deaths | Number of infant deaths |

---

# 🧹 Data Cleaning

Before performing exploratory analysis, I examined and cleaned the dataset using SQL.

### Data quality issues identified

- Duplicate Country-Year records
- Missing Status values
- Missing Life Expectancy values

### Cleaning techniques used

- Identified duplicate records using `ROW_NUMBER()`
- Used `PARTITION BY` to identify duplicate Country-Year combinations
- Removed duplicate records
- Used `JOIN` operations to retrieve country-level Status information
- Updated missing Status values
- Identified missing Life Expectancy values
- Filled missing Life Expectancy values using available country/year information

---

# 🔎 Exploratory Data Analysis

After cleaning the dataset, I performed exploratory analysis using SQL.

## 1. Life Expectancy Change by Country

**Question:**  
Which countries experienced the largest change in Life Expectancy across the available years?

I compared the minimum and maximum Life Expectancy for each country.

### SQL concepts

`MIN()` · `MAX()` · `GROUP BY` · `ORDER BY`

---

## 2. GDP and Life Expectancy

**Question:**  
How does average Life Expectancy differ between higher-GDP and lower-GDP observations?

The analysis uses a GDP threshold of 1500 to create two groups.

### SQL concepts

`CASE WHEN` · `AVG()` · Conditional Aggregation

> This analysis identifies an association in the dataset and does not establish causation.

---

## 3. Developed vs Developing Countries

**Question:**  
How does average Life Expectancy differ between Developed and Developing countries?

The analysis calculates average Life Expectancy and the number of distinct countries within each development group.

### SQL concepts

`GROUP BY` · `AVG()` · `COUNT(DISTINCT)`

---

## 4. Mortality Analysis

**Question:**  
How do Adult Mortality and Infant Deaths vary across the dataset?

The analysis examines mortality-related indicators at country and year levels.

### SQL concepts

Aggregations · `GROUP BY` · `ORDER BY`

---

## 5. India Time-Based Analysis

**Question:**  
How do Life Expectancy, Adult Mortality and Infant Deaths change across the available years for India?

The analysis tracks these indicators over time.

### SQL concepts

`WHERE` · `ORDER BY` · Time-based analysis

---

## 6. Cumulative Analysis Using Window Functions

For India, I used a SQL Window Function to calculate cumulative Adult Mortality across years.

### SQL concept

```sql
SUM(Adult_Mortality) OVER(
    PARTITION BY Country
    ORDER BY Year
)
