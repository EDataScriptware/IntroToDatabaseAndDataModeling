-- NAME: Edward Riley
-- PROFESSOR: Karen Beiter
-- COURSE: Intro to Database and Data Modeling
-- DATE: 11/20/2018

-- Drop the Riley database if it already exists
DROP DATABASE Riley_HW7;

-- Create the Riley database
CREATE DATABASE Riley_HW7;

-- Open the Riley database
USE Riley_HW7;

-- ??? ALL Foreign Keys are not working 


-- Creates category table
CREATE TABLE category(
category_Name VARCHAR(35),
shippingPerPound DECIMAL(4,2),
offersAllowed enum('y','n'),
CONSTRAINT category_pk PRIMARY KEY (category_Name)
); 

CREATE TABLE item(
item_Number INT UNSIGNED AUTO_INCREMENT,
item_Name VARCHAR(35) NOT NULL,
description VARCHAR(255),
model VARCHAR(50) NOT NULL,
price DECIMAL(8,2) NOT NULL,
category_name VARCHAR(35),
CONSTRAINT item_pk PRIMARY KEY (item_Number),
CONSTRAINT item_category_Name_fk FOREIGN KEY (category_name) REFERENCES category(category_name)
ON UPDATE CASCADE
);

CREATE TABLE line_Item(
item_Number INT UNSIGNED,
orderID INT UNSIGNED,
quantity TINYINT UNSIGNED,
shipping_amount DECIMAL(6,2),
CONSTRAINT line_Item_item_Number_fk FOREIGN KEY (item_number) REFERENCES item(item_Number)  
ON UPDATE CASCADE,
CONSTRAINT line_Item_orderID_fk FOREIGN KEY (orderID) REFERENCES ordered(orderID)
ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE offer(
offerCode VARCHAR(15),
Discount CHAR(35) NOT NULL,
minAmount DECIMAL(4,2) NOT NULL,
expirationDate DATE NOT NULL,
CONSTRAINT offer_pk PRIMARY KEY (offerCode)
);

CREATE TABLE ordered(
orderID INT UNSIGNED AUTO_INCREMENT,
total_cost DECIMAL(10,2),
customerID INT UNSIGNED NOT NULL,
offerCode VARCHAR(15),
CONSTRAINT ordered_pk PRIMARY KEY (orderID),
CONSTRAINT ordered_customerID_fk FOREIGN KEY (customerID) REFERENCES customer(orderedID)
ON UPDATE CASCADE,
CONSTRAINT ordered_offerCode_fk FOREIGN KEY (offerCode) REFERENCES offer(offerCode)
ON UPDATE CASCADE
);

CREATE TABLE customer(
customerID INT UNSIGNED AUTO_INCREMENT,
customerName VARCHAR(50) NOT NULL,
address VARCHAR(150) NOT NULL,
email VARCHAR(80),
customer_type ENUM ('business', 'home'),
CONSTRAINT customer_pk PRIMARY KEY (customerID)
);

CREATE TABLE business(
customerID INT UNSIGNED,
paymentTerms VARCHAR(50) NOT NULL,
CONSTRAINT business_pk PRIMARY KEY (customerID),
CONSTRAINT business_customerID_fk FOREIGN KEY (customerID) REFERENCES customer(customerID)
ON UPDATE CASCADE
);

CREATE TABLE home(
customerID INT UNSIGNED,
creditCardNum CHAR(16) NOT NULL,
cardExpiration CHAR(6) NOT NULL,
CONSTRAINT home_pk PRIMARY KEY (customerID),
CONSTRAINT home_customerID_fk FOREIGN KEY (customerID) REFERENCES customer(customerID)
ON UPDATE CASCADE
);

CREATE TABLE purchase_contact(
contactName VARCHAR(50),
customerID INT UNSIGNED,
contactPhone CHAR(12) NOT NULL,
CONSTRAINT purchase_contact_pk PRIMARY KEY (contactName,customerID),
CONSTRAINT purchase_contact_customerID_fk FOREIGN KEY (customerID) REFERENCES business(customerID)
ON UPDATE CASCADE
);

CREATE TABLE guarantee(
orderID INT UNSIGNED,
customerID INT UNSIGNED,
url varchar(50),
refundAmount DECIMAL(12,2),
CONSTRAINT guarantee_pk PRIMARY KEY (orderID,customerID); 
CONSTRAINT guarantee_orderID_fk FOREIGN KEY (orderID) REFERENCES ordered(orderID)
ON UPDATE CASCADE ON DELETE CASCADE,
CONSTRAINT purchase_contact_customerID_fk FOREIGN KEY (customerID) REFERENCES home(customerID)
ON UPDATE CASCADE
);

INSERT INTO category 
VALUES(
'Books',
0.99,
'y'
);

INSERT INTO category 
VALUES(
'Home',
1.99,
'y'
);

INSERT INTO category 
VALUES(
'Jewelry',
0.99,
'n'
);

INSERT INTO category 
VALUES(
'Toys',
0.99,
'y'
);

SELECT * 
FROM category;

INSERT INTO item 
VALUES(
0,
'Cabbage Patch Doll',
'Baby boy doll',
'Boy',
39.95,
'Toys'
);
 
INSERT INTO item 
VALUES(
'The Last Lecture',
'Written by Randy Pausch',
'Hardcover',
9.95,
'Books'
);

INSERT INTO item 
VALUES(
'Keurig Beverage Maker',
'Keurig Platinum Edition Beverage Maker in Red',
'Platinum Edition',
299.95,
'Home'
);

INSERT INTO item 
VALUES(
'1st diamond ring in white gold',
'diamond is certified vss, D, round',
'64t32',
4000.00,
'Jewelry'
);

SELECT *
FROM item; 

INSERT INTO offer 
VALUES(
'345743213',
'20% off',
20.00,
'2013-12-31'
);
 
INSERT INTO offer 
VALUES(
'4567890123',
'30% off',
30.00,
'2013-12-31'
);

START TRANSACTION;

SELECT *
FROM offer;

INSERT INTO customer(
customerName, 
address, 
email) 
VALUES(
'Janine Jeffers',
'152 Lomb Memorial Dr., Rochester,NY 14623',
'jxj1234@rit.edu'
); 

INSERT INTO home(
customerID, 
creditCardNum, 
cardExpiration
) 
VALUES(
(SELECT customerID FROM customer WHERE customerName = 'Janine Jeffers'),
'1234567890123456', 
'012014'); 

UPDATE customer
SET home = 1
WHERE customerName = 'Janine Jeffers'; 

INSERT INTO ordered(
total_cost, 
customerID, 
offerCode) 
VALUES(
4919.75, 
(SELECT customerID FROM customer WHERE customerName = 'Janine Jeffers'),
4567890123
); 
 
INSERT INTO line_Item VALUES(1, 4, 1,.99); 
INSERT INTO line_Item VALUES(1, 2, 2, 3.99);

INSERT INTO line_Item(
orderID, 
item_Number, 
quantity) 
VALUES(
1, 
2, 
2, 
3.99);

COMMIT; 

SELECT * FROM customer; 
SELECT * FROM ordered;
SELECT * FROM home;
SELECT * FROM line_item;

START TRANSACTION

INSERT INTO customer(
customerName,
address,
email
) 
VALUES(
'Joey John Barber Shop',
'15 John St., Rochester,NY 14623',
'jj1978@hotmail.com'
);

INSERT INTO business 
VALUES(
	(	SELECT customerID
		FROM customer 
		WHERE customerName = 'Joey John Barber Shop'
	),
'30/90 days'
); 

UPDATE customer
SET business = 1
WHERE customerName = 'Joey John Barber Shop';

INSERT INTO ordered(
total_cost, 
customerID, 
offerCode
) 

VALUES(
299.95, 
	(
		SELECT customerName 
		FROM customer 
		WHERE customerName = 'Joey John Barber Shop'
	), 
'345743213'
);

INSERT INTO line_Item(
orderID, 
item_Number, 
quantity
) 
VALUES(
2, 
3, 
1
);
 
INSERT INTO purchase_contact(
contactName, 
customerID, 
contactPhone) 
VALUES(
'Joey James', 
	(	SELECT customerID 	
		FROM customer 
		WHERE customerName = 'Joey John Barber Shop'
		), 
'585-475-1234'
);

COMMIT; 

