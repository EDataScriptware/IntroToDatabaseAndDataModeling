-- Create the PERSONAL table from the PERSONAL relation

/* PERSONAL(contactID, street, city, state, zip, rel_or_friend)
	PERSONAL(contactID) mei CONTACT(contactID)
	PK = contactID */

CREATE TABLE personal(
contactID INT UNSIGNED, /* fk */
street VARCHAR(45),
city VARCHAR(25),
state CHAR(2),
zip varchar(10), /* supports ##### or #####-#### formats */
rel_or_friend ENUM('r', 'f'), /* allows only 'r' or 'f' to be entered */
CONSTRAINT personal_pk PRIMARY KEY (contactID),
CONSTRAINT personal_contactID_fk FOREIGN KEY (contactID) REFERENCES contact(contactID));

DESCRIBE personal;

-- Add Destler as a personal contact with an invalid discrimator for rel_or_friend
INSERT INTO personal VALUES(1, '2201 Lehigh Station Road', 'Henrietta', 'NY', '14467', 'x');

SELECT * 
FROM personal;

-- Add Destler as a personal contact with valid data
INSERT INTO personal VALUES(1, '2201 Lehigh Station Road', 'Henrietta', 'NY', '14467', NULL);

SELECT *
FROM personal;

-- Update Destler's contact record to set personal discrimator to true
UPDATE contact
SET personal=1
WHERE contactID=1;

SELECT *
FROM contact;

