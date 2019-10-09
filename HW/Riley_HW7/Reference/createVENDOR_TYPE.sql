-- Create VENDOR_TYPE table from the VENDOR_TYPE relation

/* VENDOR_TYPE(vendor_typeID, description)
	PK = vendor_typeID */

/* Includes use of AUTO_INCREMENT (http://dev.mysql.com/doc/refman/5.7/en/example-auto-increment.html) */

CREATE TABLE vendor_type(
vendor_typeID TINYINT UNSIGNED AUTO_INCREMENT, -- can hold range of 0 - 255
description varchar(50) NOT NULL,
CONSTRAINT vendor_type_pk PRIMARY KEY (vendor_typeID));

DESCRIBE vendor_type;

-- Shows variations that can be used with AUTO-INCREMENT
INSERT INTO vendor_type (description) VALUES('Caterer');
INSERT INTO vendor_type VALUES(0, 'PhotogGrapher');
INSERT INTO vendor_type VALUES(NULL, 'DJ');

-- Attempt to specify a value for vendor_typeID, an auto_increment attribute
INSERT INTO vendor_type VALUES( 5, 'Tent Rental');

-- What value for auto_increment will be used after a specific number was specified?
INSERT INTO vendor_type (description) VALUES('Table Rental');

-- Does an update generate a new auto_increment number for the vendor_typeID?
UPDATE vendor_type
SET description = 'Photographer'
WHERE vendor_typeID = 2;

-- Delete a record and insert a new record to see what auto_increment does
DELETE FROM vendor_type 
WHERE vendor_typeID=6;

INSERT INTO vendor_type (Description) VALUES ('Table & Chair Rental');

SELECT * FROM vendor_type; 

-- Used to see the last value used for auto_increment
SELECT LAST_INSERT_ID();