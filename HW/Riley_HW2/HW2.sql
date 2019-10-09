-- AUTHOR: EDWARD RILEY
-- PROJECT: HW2
-- DATE: 2018/09/11
-- PURPOSE: Be able to retrieve information on a single ITEM database.

-- Drop the database if it already exists
DROP DATABASE IF EXISTS hw02;

CREATE DATABASE hw02;

USE hw02;

CREATE TABLE item
(
    state CHAR(2),
	Zipcode VARCHAR(10),
    cost VARCHAR(10),
    Retail_price VARCHAR(10),
    Notes VARCHAR(255),
    Description VARCHAR(255),
    Returnable CHAR(1),
    Perishable CHAR(1),
	Shelf_Qty INT,
    Name VARCHAR(25),
    Street VARCHAR(25),
    City VARCHAR(25),
    ItemID VARCHAR(25),
    ItemName VARCHAR(25),
    Colors VARCHAR(25),
    
    CONSTRAINT item_pk PRIMARY KEY(ItemID)

);