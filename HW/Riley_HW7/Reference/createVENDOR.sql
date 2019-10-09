-- Create the VENDOR table from the VENDOR relation

/* VENDOR(contactID, co_worker_referrer_contactID)
	VENDOR(contactID) mei CONTACT(contactID)
	VENDOR(co_worker_referrer_contactID) mei CO_WORKER(contactID)
	PK = contactID */

CREATE TABLE vendor(
contactID INT UNSIGNED, /* fk */
co_worker_referrer_contactID INT UNSIGNED NOT NULL, /* fk */
CONSTRAINT vendor_pk PRIMARY KEY (contactID),
CONSTRAINT vendor_contactID_fk FOREIGN KEY (contactID) REFERENCES contact(contactID),
CONSTRAINT vendor_co_worker_referrer_contactID_fk FOREIGN KEY (co_worker_referrer_contactID) REFERENCES co_worker(contactID));

DESCRIBE vendor;


