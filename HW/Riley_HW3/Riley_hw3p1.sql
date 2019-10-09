-- Name: Edward Riley
-- Professor: Karen Beiter
-- Course: Intro to Database and Data Modeling
-- Date: 9/20/2018


-- Q1
SELECT HeadOfState FROM Country WHERE LocalName LIKE 'United States';

-- Q2
UPDATE Country SET HeadOfState = 'Donald Trump' WHERE LocalName = 'United States';

-- Q3
SELECT Name AS 'Country Name' FROM Country WHERE IndepYear IS NULL;

-- Q4
SELECT Name, Continent FROM Country WHERE (population > 1000000000) AND (LifeExpectancy BETWEEN 70 AND 80);

-- Q5
SELECT NAME FROM COUNTRY WHERE CONTINENT = "North America" OR CONTINENT = "South America";





