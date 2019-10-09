-- Create the VENDOR_VENDOR_TYPE table from the VENDOR_VENDOR_TYPE (intersection) relation

/* VENDOR_VENDOR_TYPE(contactID, vendor_typeID)
	VENDOR_VENDOR_TYPE(contactID) mei VENDOR(contactID)
	VENDOR_VENDOR_TYPE(vendor_typeID) mei VENDOR_TYPE(vendor_typeID)
	PK = contactID, vendor_typeID */

CREATE TABLE vendor_vendor_type(
contactID INT UNSIGNED, /* fk */
vendor_typeID TINYINT UNSIGNED,  /* fk */
CONSTRAINT vendor_vendor_type_pk PRIMARY KEY (contactID, vendor_typeID),
CONSTRAINT vendor_vendor_type_contactID_fk FOREIGN KEY (contactID) REFERENCES vendor(contactID),
CONSTRAINT vendor_vendor_type_vendor_typeID_fk FOREIGN KEY (vendor_typeID) REFERENCES vendor_type(vendor_typeID));

DESCRIBE vendor_vendor_type;

