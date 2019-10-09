-- Create the CONTACT_PHONE table from the CONTACT_PHONE (intersection) relation

/* CONTACT_PHONE(contactID, phone_number)
	CONTACT_PHONE(contactID) mei CONTACT(contactID)
	CONTACT_PHONE(phone_number) mei PHONE(phone_number)
	PK = contactID, phone_number */

CREATE TABLE contact_phone(
contactID INT UNSIGNED, /* fk */
phone_number VARCHAR(20),  /* fk */
CONSTRAINT contact_phone_pk PRIMARY KEY (contactID, phone_number),
CONSTRAINT contact_phone_contactID_fk FOREIGN KEY (contactID) REFERENCES contact(contactID),
CONSTRAINT contact_phone_phone_number_fk FOREIGN KEY (phone_number) REFERENCES phone(phone_number));

DESCRIBE contact_phone;

-- Add a record
INSERT INTO contact_phone VALUES(1, '585-475-2396');

SELECT *
FROM contact_phone;
