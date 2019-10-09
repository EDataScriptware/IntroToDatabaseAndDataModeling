-- NAME: Edward Riley
-- PROFESSOR: Karen Beiter
-- COURSE: Intro to Database and Data Modeling
-- DATE: 12/09/2018

-- Q1

SELECT (CONCAT(City, ',', Statecode)) AS 'Location', COUNT(CONCAT(City, ',', Statecode)) AS 'Count'
FROM Publisher
GROUP BY Location
ORDER BY COUNT, Location DESC;

-- Q2

SELECT Book.Title, COUNT(BookReview.Rating) AS 'Total Ratings', MIN(BookReview.Rating) AS 'Low', 
MAX(BookReview.Rating) AS 'High', ROUND(AVG(BookReview.Rating),2) AS 'Average' 
FROM Book LEFT OUTER JOIN BookReview 
ON Book.ISBN = BookReview.ISBN
GROUP BY Book.Title
ORDER BY COUNT(BookReview.Rating) DESC, Average DESC; 

-- Q3

SELECT Publisher.Name AS 'Publisher Name', COUNT(Book.ISBN) AS 'Book Count' 
FROM Publisher INNER JOIN Book 
WHERE Publisher.PublisherID = Book.PublisherID
GROUP BY publisher.Name
HAVING COUNT(Book.ISBN) > 2
ORDER BY COUNT(Book.ISBN) DESC, Publisher.Name; 

-- Q4
SELECT title, LENGTH(title) AS 'Length', 
SUBSTR(title,INSTR(title,'Bill')+4) AS 'After Bill' 
FROM Book 
WHERE title LIKE '%Bill%'; 

-- Q5

SELECT DISTINCT Book.title AS 'title'
FROM OwnersBook JOIN Book
ON Book.ISBN = OwnersBook.ISBN;


