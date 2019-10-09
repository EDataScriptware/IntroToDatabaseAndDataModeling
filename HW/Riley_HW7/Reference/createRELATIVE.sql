-- Create the RELATIVE table from the RELATIVE relation

/* RELATIVE(contactID, relationship)
	RELATIVE(contactID) mei PERSONAL(contactID)
	PK = contactID */

CREATE TABLE relative(
contactID INT UNSIGNED, /* fk */
relationship VARCHAR(20) NOT NULL DEFAULT 'UNKNOWN',
CONSTRAINT relative_pk PRIMARY KEY (contactID),
CONSTRAINT relative_contactID_fk FOREIGN KEY (contactID) REFERENCES personal(contactID));

DESCRIBE relative;
