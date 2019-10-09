-- Author : Edward Riley
-- Professor : Karen Beiter
-- Date: 9/18/2018
-- Intro to Database and Data Modeling

USE sakilav1;

SELECT title, length
FROM film
where description like '%fun%' AND length <= 120;

SELECT title 
FROM film 
WHERE title 
LIKE '%a' OR title LIKE '%e' OR title LIKE '%i' OR title LIKE '%o' OR title LIKE '%u';

SELECT title  
FROM film 
WHERE length >=120 AND length <=180;

SELECT title, Length 
FROM film 
WHERE title LIKE '%river%' AND rating IN ('PG','PG-13'); 

SELECT title
FROM film 
WHERE release_year > 2012 AND length > 160;

SELECT title, replacement_cost AS 'Replacement Cost', Rating
FROM film 
WHERE title NOT LIKE ('_a%') AND replacement_cost = 19.99; 
 
SELECT title 
FROM film 
WHERE description IS NULL;
 
SELECT replacement_cost AS 'Replacement Cost'
FROM film
WHERE title = 'Town Ark';
  
SELECT title
FROM film
WHERE (rating IN ('G') AND release_year = 2006) OR (rating IN ('PG') AND release_year = 2010);
 
SELECT Film_ID AS 'Film ID', Title, release_year AS 'Release Year', Length, replacement_cost AS 'Replacement Cost', Rating 
FROM film 
WHERE release_year NOT IN (2006, 2010);
 
UPDATE film SET replacement_cost = 5.59 
WHERE release_year = 2006; 
 
DELETE FROM film
WHERE length < 60 AND Rating = 'PG';