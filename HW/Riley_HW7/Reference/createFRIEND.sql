-- Create the FRIEND table from the FRIEND relation

/* FRIEND(contactID, know_from)
	FRIEND(contactID) mei PERSONAL(contactID)
	PK = contactID */

CREATE TABLE friend(
contactID INT UNSIGNED, /* fk */
know_from varchar(100),
CONSTRAINT friend_pk PRIMARY KEY (contactID),
CONSTRAINT friend_contactID_fk FOREIGN KEY (contactID) REFERENCES personal(contactID));

DESCRIBE friend;

-- Add Destler as a friend
INSERT INTO friend VALUES(1, 'Banjo class');

-- Update Destler's discriminator in personal to reflect friend
UPDATE personal 
SET rel_or_friend='f'
WHERE contactID=1;

SELECT * 
FROM friend;

SELECT *
FROM personal;

