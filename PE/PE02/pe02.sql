-- AUTHOR: EDWARD RILEY
-- PROJECT: PE02
-- DATE: 2018/09/11
-- PURPOSE: Learn how to use TEE and SQL scripts

-- Drop the database if it already exists


DROP DATABASE pe02;

CREATE DATABASE pe02;

USE pe02;

CREATE TABLE book
(
    title VARCHAR(50), 
    isbn13number CHAR(13),
    author1  VARCHAR(50),
    author2 VARCHAR(50),
    author3 VARCHAR(50),
    author4 VARCHAR(50),
    author5 VARCHAR(50),
    number_of_pages INT,
    release_date DATE,
    CONSTRAINT book_pk PRIMARY KEY(isbn13number)

);

DESCRIBE book;

INSERT INTO book
(
    title, isbn13number, author1, author2, author3, author4, author5,
        number_of_pages, release_date
)
VALUES
(
    'My Favorite Story', '1234567890123', 'Edward Riley', 'Joe Author', 'Bill Bookwriter',
    'Nancy Novelist', 'Sam Shortstory', 192, '2018-09-11'
);

INSERT INTO book
(
    title, isbn13number, author1
)
VALUES
(
    'Another book', '3210987654321', null
);

SELECT * from book;

SELECT title, isbn13number, author1 from book;


INSERT INTO book
(
    title, isbn13number, author1, author2
)
VALUES
(
    'A Brief History of Time', '2134567890123', 'Edward Riley', 'Stephen Hawking'
);

SELECT title AS Title, isbn13number AS ISBN FROM book
WHERE author1 IS NULL;

