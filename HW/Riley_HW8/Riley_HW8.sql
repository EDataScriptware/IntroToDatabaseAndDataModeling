-- NAME: Edward Riley
-- PROFESSOR: Karen Beiter
-- COURSE: Intro to Database and Data Modeling
-- DATE: 11/29/2018

-- Q1 
SELECT statecode FROM employer 
UNION 
SELECT location FROM quarter;

-- Q2 
SELECT DISTINCT employer.companyname, interview.division, employer.statecode, interview.salaryoffered
FROM interview JOIN employer                  		      
ON interview.companyname = employer.companyname;

-- Q3
SELECT * FROM state
WHERE statecode NOT IN 
(
	SELECT statecode
	FROM employer
);

-- Q4 
SELECT DISTINCT companyname, minhrsoffered FROM interview; 

-- Q5
SELECT * FROM state 
WHERE description LIKE '__a%' 
OR description LIKE '__e%' 
OR description LIKE '__i%' 
OR description LIKE '__o%'
OR description LIKE '__u%';

-- Q6
SELECT DISTINCT quarter.qtrcode, quarter.location, state.description  FROM quarter
INNER JOIN state
ON quarter.location = state.statecode;


-- Q7
SELECT state.description, employer.companyname FROM state 
LEFT OUTER JOIN employer
ON employer.statecode = state.statecode;