-- Name: Edward Riley
-- Professor: Karen Beiter 
-- Course: Intro to Database & Data Modeling
-- Date: 9/20/18


-- statement 1
INSERT INTO contact_info (
contactID,
firstname,
lastname,
phone_number,
phonetype_description) 

VALUES (
10,
'Jessica',
'Smith',
'888-888-8888',
'work'
); 
 
-- statement 2
INSERT INTO contact_info (
contactID,
firstname,
lastname,
phone_number,
phonetype_description
)

VALUES 
(10,
'Jessica',
'Smith',
'999-99-9999',
'cell'); 


ALTER TABLE contact_info 
DROP PRIMARY KEY;

ALTER TABLE contact_info
ADD PRIMARY KEY contact_info_pk(contactID, phone_number);
 
SELECT *
FROM contact_info;

ALTER TABLE contact_info
ALTER firstname SET DEFAULT 'UNKNOWN';

ALTER TABLE contact_info
ALTER lastname SET DEFAULT 'UNKNOWN';

INSERT INTO contact_info (
contactID,
firstname,
lastname,
phone_number
)

VALUES
(
11,
'Edward',
'Riley',
'123-456-7890'
);

ALTER TABLE contact_info
ADD COLUMN owes DECIMAL(6,2);