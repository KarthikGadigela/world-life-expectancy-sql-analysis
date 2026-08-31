# World Life Expectancy — SQL Data Analysis

## 📌 Project Overview

This project analyzes World Life Expectancy data using MySQL.

The project focuses on data cleaning and exploratory data analysis to understand patterns in Life Expectancy across countries and years, with additional analysis of GDP, development status, BMI, Adult Mortality and Infant Deaths.

---

## 🎯 Project Objective

The objective of this project is to clean and analyze World Life Expectancy data using SQL and answer analytical questions related to:

- Life Expectancy changes across countries
- GDP and Life Expectancy
- Developed vs Developing countries
- BMI
- Adult Mortality
- Infant Deaths
- India-specific trends

---

## 🗂️ Dataset

**Dataset:** World Life Expectancy

**Period:** 2007–2022

**Countries:** 193

**Records:** 2,941

### Key Variables

- Country
- Year
- Life Expectancy
- Status
- GDP
- BMI
- Adult Mortality
- Infant Deaths

---

## 🧹 Data Cleaning

Before performing the analysis, I cleaned the dataset using MySQL.

### Cleaning activities

- Identified duplicate Country-Year records
- Removed duplicate records
- Identified missing Status values
- Filled missing Status values using country-level information
- Identified missing Life Expectancy values
- Filled missing Life Expectancy values using available country/year information

### SQL techniques used

- `ROW_NUMBER()`
- `PARTITION BY`
- `JOIN`
- `UPDATE`

---

## 🔎 Exploratory Data Analysis

The cleaned dataset was analyzed to answer the following questions:

### 1. Life Expectancy Change

Which countries experienced the largest change in Life Expectancy between 2007 and 2022?

### 2. GDP Analysis

How does average Life Expectancy differ between higher-GDP and lower-GDP observations?

### 3. Development Status

How does average Life Expectancy differ between Developed and Developing countries?

### 4. BMI Analysis

How does average BMI vary across countries?

### 5. Mortality Analysis

What are the Adult Mortality and Infant Death patterns in the dataset?

### 6. India Analysis

How do Life Expectancy, Adult Mortality and Infant Deaths change across the available years for India?

### 7. Time-Based Analysis

How can Window Functions be used to calculate cumulative Adult Mortality over time?

---

# 📊 Key Findings

## 1. Developed vs Developing Countries

| Status | Average Life Expectancy |
|---|---:|
| Developed | 79.20 years |
| Developing | 66.83 years |

**Difference: 12.37 years**

The dataset shows a substantial difference in average Life Expectancy between Developed and Developing countries.

---

## 2. GDP and Life Expectancy

| GDP Group | Average Life Expectancy |
|---|---:|
| Higher GDP | 74.20 years |
| Lower GDP | 64.70 years |

**Difference: 9.50 years**

The higher-GDP group showed a higher average Life Expectancy in this dataset.

> Note: This analysis identifies an association in the dataset and does not establish causation.

---

## 3. Largest Life Expectancy Increase

**Haiti**

| Year | Life Expectancy |
|---|---:|
| 2007 | 36.3 |
| 2022 | 65.0 |

**Increase: 28.7 years**

Haiti recorded the largest Life Expectancy increase in the country-level comparison.

---

## 4. India: 2007–2022

| Indicator | 2007 | 2022 |
|---|---:|---:|
| Life Expectancy | 62.5 | 68.3 |
| Adult Mortality | 224 | 181 |
| Infant Deaths | 1,800 | 910 |

Life Expectancy increased by **5.8 years** over the period.

Infant Deaths decreased by **890** in the dataset.

---

## 🛠️ SQL Skills Demonstrated

### Data Cleaning
- Duplicate detection
- Missing-value handling
- `ROW_NUMBER()`

### Data Transformation
- `JOIN`
- `UPDATE`
- `CASE WHEN`

### Data Analysis
- `GROUP BY`
- `HAVING`
- `AVG()`
- `MIN()`
- `MAX()`
- `SUM()`
- Conditional aggregation

### Advanced SQL
- CTEs
- Window Functions
- `PARTITION BY`
- `ORDER BY`

---

## 💡 Key Learning

This project helped me move beyond learning SQL syntax and apply SQL to a complete data-analysis workflow:

**Data Cleaning → Exploration → Analysis → Insights**

The biggest takeaway was that SQL is not just about retrieving data; it is about asking meaningful questions and using data to answer them.

---

## 🚀 Future Improvements

Potential future extensions of this project include:

- Statistical correlation analysis
- Additional time-series analysis
- Visualization of key findings
- Further investigation of relationships between socioeconomic and health indicators
