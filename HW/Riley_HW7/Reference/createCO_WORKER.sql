-- Create the CO_WORKER table from the CO_WORKER relation

/* CO_WORKER(contactID, office_number)
	CO_WORKER(contactID) mei CONTACT(contactID)
	PK = contactID */

CREATE TABLE co_worker(
contactID INT UNSIGNED,  /* fk */
office_number varchar(20),
CONSTRAINT co_worker_pk PRIMARY KEY (contactID),
CONSTRAINT co_worker_contactID_fk FOREIGN KEY (contactID) REFERENCES contact(contactID));

DESCRIBE co_worker;

-- Add Destler as a co-worker
INSERT INTO co_worker (contactID, office_number) SELECT contactID, 'Bldg. 1, 7th Floor' FROM contact WHERE firstname='William' and lastname='Destler';

SELECT * 
FROM co_worker;

-- Update discriminator in CONTACT (supertype)
UPDATE contact
SET co_worker=1
WHERE firstname='William' AND lastname='Destler';

SELECT * 
FROM contact;



