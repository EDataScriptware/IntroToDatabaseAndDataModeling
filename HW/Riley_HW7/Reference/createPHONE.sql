-- Create the PHONE table from the PHONE relation

/* PHONE(phone_number, phonetype_description) 
	PK = phone_number */


CREATE TABLE phone(
phone_number VARCHAR(20),
phonetype_description VARCHAR(8),
CONSTRAINT phone_pk PRIMARY KEY (phone_number));

DESCRIBE phone;

-- Add a phone for Destler
INSERT INTO phone VALUES('585-475-2396','work');