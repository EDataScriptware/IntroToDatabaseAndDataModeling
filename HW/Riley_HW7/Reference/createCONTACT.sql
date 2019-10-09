-- Create the CONTACT table from the CONTACT relation

/* CONTACT(contactID, firstname, middleinitial, lastname, suffix_description, title_description, jobtitle, department, email, url, IMaddress, birthday, notes, co_worker, vendor, personal, companyname)
	CONTACT(companyname) mei COMPANY(companyname)
	PK = contactID */

CREATE TABLE contact(
contactID INT UNSIGNED AUTO_INCREMENT,
firstname VARCHAR(15),
middleinitial CHAR(1),
lastname VARCHAR(25),
suffix_description VARCHAR(5),
title_description VARCHAR(5),
jobtitle VARCHAR(35),
department VARCHAR(30),
email VARCHAR(40),
url VARCHAR(40),
IMadress VARCHAR(25),
birthday DATE,
notes VARCHAR(255),
co_worker TINYINT(1) NOT NULL DEFAULT 0,  /* discriminating attribute for co_worker subtype */
vendor TINYINT(1) NOT NULL DEFAULT 0, /* discriminating attribute for vendor subtype */
personal TINYINT(1) NOT NULL DEFAULT 0, /* discriminating attribute for personal subtype */
companyname varchar(35),
CONSTRAINT contact_pk PRIMARY KEY (contactID),
CONSTRAINT contact_companyname_fk FOREIGN KEY (companyname) REFERENCES company(companyname));

DESCRIBE contact;

-- Add Destler's record
INSERT INTO contact VALUES (0, 'William','W', 'Destler', 'I', 'Dr.', 'President', 'Office of the President', 'destler@rit.edu', 'www.rit.edu/president/index.php', 'destler', '1946-08-26', 'Started as President of RIT on July 1, 2007', 0, 0, 0, 'Rochester Institute of Technology');

SELECT * 
FROM contact;
