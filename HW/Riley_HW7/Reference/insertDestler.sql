-- Destler
 

-- Add his work PHONE
INSERT INTO phone VALUES('585-475-2396','work');

-- Add RIT as a COMPANY
INSERT INTO company VALUES('Rochester Institute of Technology', 'www.rit.edu','585-475-6991', '1 Lomb Memorial Drive', NULL, 'Rochester', 'NY', '14623', 'USA', NULL);

-- Add Destler as a CONTACT
INSERT INTO contact VALUES (0, 'William','W', 'Destler', 'I', 'Dr.', 'President', 'Office of the President', 'destler@rit.edu', 'www.rit.edu/president/index.php', 'destler', '1946-08-26', 'Started as President of RIT on July 1, 2007', 0, 0, 0, 'Rochester Institute of Technology');

-- Add Destler as a CO_WORKER
INSERT INTO co_worker (contactID, office_number) SELECT contactID, 'Bldg. 1, 7th Floor' FROM contact WHERE firstname='William' and lastname='Destler';

-- Update discriminator in CONTACT (supertype)
UPDATE contact
SET co_worker=1
WHERE firstname='William' AND lastname='Destler';

-- Add Destler as a PERSONAL contact
INSERT INTO personal VALUES(1, '2201 Lehigh Station Road', 'Henrietta', 'NY', '14467', NULL);

-- Update Destler's contact record to set personal discrimator to true
UPDATE contact
SET personal=1
WHERE contactID=1;

-- Add Destler as a FRIEND
INSERT INTO friend VALUES(1, 'Banjo class');

-- Update Destler's discriminator in PERSONAL to reflect friend
UPDATE personal 
SET rel_or_friend='f'
WHERE contactID=1;

-- Add a connection between Destler and his phone in CONTACT_PHONE
INSERT INTO contact_phone VALUES(1, '585-475-2396');


SELECT *
FROM phone;

SELECT *
FROM company;

SELECT * 
FROM contact;

SELECT * 
FROM co_worker;

SELECT *
FROM personal;


SELECT * 
FROM friend;

SELECT *
FROM contact_phone;

