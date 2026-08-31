/*
===========================================================
PROJECT: World Life Expectancy - SQL Data Analysis
AUTHOR: Karthik Gadigela
TOOL: MySQL
PROJECT TYPE: Data Cleaning & Exploratory Data Analysis
DATA PERIOD: 2007 - 2022
===========================================================

PROJECT OBJECTIVE:
Analyze World Life Expectancy data to explore patterns
across Life Expectancy, GDP, development status, BMI,
Adult Mortality and Infant Deaths.

PROJECT WORKFLOW:
1. Data Cleaning
2. Exploratory Data Analysis
3. Key Insights

SQL CONCEPTS USED:
- SELECT / WHERE
- GROUP BY / HAVING
- JOINs
- CASE WHEN
- CTEs
- Aggregations
- ROW_NUMBER()
- Window Functions

===========================================================
*/

-- ========================================================
-- 1. DATA CLEANING
-- ========================================================

SELECT * 
FROM world_life_expectancy
;

SELECT country, year,
		CONCAT(country, year), COUNT(CONCAT(country, year))
		FROM world_life_expectancy
		GROUP BY country, year,CONCAT(country, year)
		HAVING COUNT(CONCAT(country, year))>1
;



DELETE FROM world_life_expectancy
WHERE row_id IN(
(SELECT row_id
FROM 
    (SELECT row_id, CONCAT(country,year),
	ROW_NUMBER() OVER(PARTITION BY CONCAT(country,year) ORDER BY CONCAT(country,year))AS row_num
	FROM world_life_expectancy) AS row_table
WHERE row_num > 1)
)
;

-- ========================================================
-- 2. HANDLE MISSING VALUES
-- ========================================================

SELECT *
FROM world_life_expectancy
WHERE status = '';

SELECT DISTINCT(status)
FROM world_life_expectancy
WHERE status <> '';

SELECT 	country
WHERE status = 'Developing';

UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
ON t1.country = t2.country 
SET t1.status = 'Developing'
WHERE t1.status = ''
AND t2.status <> ''
AND t2.status = 'Developing'
;

    
UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
ON t1.country = t2.country 
SET t1.status = 'Developed'
WHERE t1.status = ''
AND t2.status <> ''
AND t2.status = 'Developed'
;

SELECT t1.country, t1.year, t1.`Life expectancy`,  
		t2.country, t2.year, t2.`Life expectancy`,
        t3.country, t3.year, t3.`Life expectancy`,
		ROUND((t2.`Life expectancy` + t3.`Life expectancy`)/2,1)
FROM world_life_expectancy t1
JOIN world_life_expectancy t2
ON t1.country = t2.country
AND t1.year = t2.year - 1
JOIN world_life_expectancy t3
ON t1.country = t3.country
AND t1.year = t3.year + 1  
WHERE t1.`Life expectancy` = ''
;

UPDATE world_life_expectancy t1
JOIN world_life_expectancy t2
ON t1.country = t2.country
AND t1.year = t2.year - 1
JOIN world_life_expectancy t3
ON t1.country = t3.country
AND t1.year = t3.year + 1  
SET t1.`Life expectancy`= ROUND((t2.`Life expectancy` + t3.`Life expectancy`)/2,1)
WHERE t1.`Life expectancy` = ''
;

SELECT * 
FROM world_life_expectancy
WHERE `Life expectancy` = '';

-- ========================================================
-- 3. EXPLORATORY DATA ANALYSIS
-- ========================================================

SELECT * 
FROM world_life_expectancy;

-- --------------------------------------------------------
-- 3.1 LIFE EXPECTANCY CHANGE BY COUNTRY
-- --------------------------------------------------------

SELECT country,MIN(year), MAX(YEAR)
FROM world_life_expectancy
GROUP BY country;

SELECT country, MIN(`Life expectancy`) AS '2007',
				MAX(`Life expectancy`) AS '2022',
				ROUND(MAX(`Life expectancy`)-MIN(`Life expectancy`),1)AS life_exp
FROM world_life_expectancy
GROUP BY country
HAVING MIN(`Life expectancy`) <> 0
AND MAX(`Life expectancy`) <> 0
ORDER BY life_exp DESC
;

-- --------------------------------------------------------
-- 3.2 GDP AND LIFE EXPECTANCY ANALYSIS
-- --------------------------------------------------------

SELECT country, ROUND(AVG(`Life expectancy`),2)AS avg_life_exp, ROUND(AVG(GDP),2) AS avg_gdp
FROM world_life_expectancy
GROUP BY country
HAVING AVG(`Life expectancy`) <> 0
AND AVG (GDP) > 0
ORDER BY avg_gdp DESC;

SELECT * 
FROM world_life_expectancy;

SELECT country, ROUND(AVG(`Life expectancy`),1)AS avg_life_exp, ROUND(AVG(GDP),1) AS avg_gdp
FROM world_life_expectancy
GROUP BY country;

-- Question:
-- How does average Life Expectancy differ between
-- higher-GDP and lower-GDP observations?

SELECT 
SUM(CASE 
	WHEN GDP >= 1500 THEN 1 ELSE 0 END)AS high_gdp,
AVG(CASE 
	WHEN GDP >= 1500  THEN  `Life expectancy` ELSE NULL END) high_avg_gdp_life,
    SUM(CASE 
	WHEN GDP <= 1500 THEN 1 ELSE 0 END)AS low_gdp,
AVG(CASE 
	WHEN GDP <= 1500  THEN  `Life expectancy` ELSE NULL END) low_avg_gdp_life
FROM world_life_expectancy;
-- Note:
-- This analysis explores an association between GDP group
-- and average Life Expectancy. It does not establish causation.


-- --------------------------------------------------------
-- 3.6 INDIA TIME-BASED ANALYSIS
-- --------------------------------------------------------

-- Question:
-- How do Life Expectancy, Adult Mortality and Infant Deaths
-- change across the available years for India?

SELECT
    year,
    `Life expectancy`,
    `Adult Mortality`,
    `infant deaths`
FROM world_life_expectancy
WHERE country = 'India'
ORDER BY year;


-- Question:
-- What is the cumulative Adult Mortality across years
-- for India?

SELECT
    country,
    year,
    `Adult Mortality`,
    SUM(`Adult Mortality`) OVER(
        PARTITION BY country
        ORDER BY year
    ) AS rolling_total_mortality
FROM world_life_expectancy
WHERE country = 'India'
ORDER BY year;

-- --------------------------------------------------------
-- 3.7 Developed VS Developing
-- --------------------------------------------------------

SELECT Status, ROUND(AVG(`Life expectancy`),2)
FROM world_life_expectancy
GROUP BY status;

SELECT Status, COUNT(DISTINCT country),ROUND(AVG(`Life expectancy`),2)
FROM world_life_expectancy
GROUP BY Status;









