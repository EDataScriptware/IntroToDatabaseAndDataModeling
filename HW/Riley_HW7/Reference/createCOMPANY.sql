-- Create the COMPANY table from the COMPANY relation

/* COMPANY(companyname, company_url, company_phone, address_line1, address_line2, city, state_province, zip_postalcode, country_region, parent_companyname)
	COMPANY(parent_companyname) mei COMPANY(companyname)
	PK = companyname */

CREATE TABLE company(
companyname VARCHAR(35),
company_url VARCHAR(45),
company_phone VARCHAR(12),
address_line1 VARCHAR(45),
address_line2 VARCHAR(45),
city VARCHAR(25),
state_province VARCHAR(20),
zip_postalcode VARCHAR(10),
country_region VARCHAR(15),
parent_companyname VARCHAR(35), /* foreign key from recursive relationship; NOT NULL needed? */
CONSTRAINT company_pk PRIMARY KEY(companyname),
CONSTRAINT company_parent_companyname_fk FOREIGN KEY (parent_companyname) REFERENCES company(companyname));

DESCRIBE company;

-- Illustrate referential integrity being enforced through foreign key constraint
INSERT INTO company VALUES('Apple','www.apple.com','408-996-1010', '1 Infinite Loop', NULL, 'Cupertino', 'CA', '95014','USA', NULL);

INSERT INTO company VALUES('FileMaker', 'www.filemaker.com','408-987-7000', '5201 Patrick Henry Drive', NULL, 'Santa Clara', 'CA', '95054','USA', 'Apple');

INSERT INTO company VALUES('Skype', 'www.skype.com', NULL, '23-29 Rives de Clausen', NULL, NULL, NULL, 'L-2165', 'Luxembourg', 'Microsoft Corp.');

-- Add RIT
INSERT INTO company VALUES('Rochester Institute of Technology', 'www.rit.edu','585-475-6991', '1 Lomb Memorial Drive', NULL, 'Rochester', 'NY', '14623', 'USA', NULL);

SELECT * 
FROM company;
