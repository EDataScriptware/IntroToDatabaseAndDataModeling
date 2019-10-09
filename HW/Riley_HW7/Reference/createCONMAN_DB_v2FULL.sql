-- Drop the CONMAN database if it already exists
DROP DATABASE conmanv2;

-- Create the CONMAN database
CREATE DATABASE conmanv2;

-- open the database
USE conmanv2;


/* ----------------------------------------
Create the PHONE table from the PHONE relation
PHONE(phone_number, phonetype_description) 
	PK = phone_number */

CREATE TABLE phone(
phone_number VARCHAR(20),
phonetype_description VARCHAR(8),
CONSTRAINT phone_pk PRIMARY KEY (phone_number));

DESCRIBE phone;

/* ----------------------------------------
Create VENDOR_TYPE table from the VENDOR_TYPE relation

VENDOR_TYPE(vendor_typeID, description)
	PK = vendor_typeID 

Includes use of AUTO_INCREMENT (http://dev.mysql.com/doc/refman/5.6/en/example-auto-increment.html) */

CREATE TABLE vendor_type(
vendor_typeID TINYINT UNSIGNED AUTO_INCREMENT, -- can hold range of 0 - 255
description varchar(50) NOT NULL,
CONSTRAINT vendor_type_pk PRIMARY KEY (vendor_typeID));

DESCRIBE vendor_type;

/* ----------------------------------------
Create the COMPANY table from the COMPANY relation

COMPANY(companyname, company_url, company_phone, address_line1, address_line2, city, state_province, zip_postalcode, country_region, parent_companyname)
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

/* ----------------------------------------
Create the CONTACT table from the CONTACT relation

CONTACT(contactID, firstname, middleinitial, lastname, suffix_description, title_description, jobtitle, department, email, url, IMaddress, birthday, notes, co_worker, vendor, personal, companyname)
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

/* ----------------------------------------
Create the CO_WORKER table from the CO_WORKER relation

CO_WORKER(contactID, office_number)
	CO_WORKER(contactID) mei CONTACT(contactID)
	PK = contactID */

CREATE TABLE co_worker(
contactID INT UNSIGNED,  /* fk */
office_number varchar(20),
CONSTRAINT co_worker_pk PRIMARY KEY (contactID),
CONSTRAINT co_worker_contactID_fk FOREIGN KEY (contactID) REFERENCES contact(contactID));

DESCRIBE co_worker;

/* ----------------------------------------
Create the VENDOR table from the VENDOR relation

VENDOR(contactID, co_worker_referrer_contactID)
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

/* ----------------------------------------
Create the PERSONAL table from the PERSONAL relation

PERSONAL(contactID, street, city, state, zip, rel_or_friend)
	PERSONAL(contactID) mei CONTACT(contactID)
	PK = contactID */

CREATE TABLE personal(
contactID INT UNSIGNED, /* fk */
street VARCHAR(45),
city VARCHAR(25),
state CHAR(2),
zip varchar(10), /* supports ##### or #####-#### formats */
rel_or_friend ENUM('r', 'f'), /* allows only 'r' or 'f' to be entered */
CONSTRAINT personal_pk PRIMARY KEY (contactID),
CONSTRAINT personal_contactID_fk FOREIGN KEY (contactID) REFERENCES contact(contactID));

DESCRIBE personal;

/* ----------------------------------------
Create the RELATIVE table from the RELATIVE relation

RELATIVE(contactID, relationship)
	RELATIVE(contactID) mei PERSONAL(contactID)
	PK = contactID */

CREATE TABLE relative(
contactID INT UNSIGNED, /* fk */
relationship VARCHAR(20) NOT NULL DEFAULT 'UNKNOWN',
CONSTRAINT relative_pk PRIMARY KEY (contactID),
CONSTRAINT relative_contactID_fk FOREIGN KEY (contactID) REFERENCES personal(contactID));

DESCRIBE relative;

/* ----------------------------------------
Create the FRIEND table from the FRIEND relation

FRIEND(contactID, know_from)
	FRIEND(contactID) mei PERSONAL(contactID)
	PK = contactID */

CREATE TABLE friend(
contactID INT UNSIGNED, /* fk */
know_from varchar(100),
CONSTRAINT friend_pk PRIMARY KEY (contactID),
CONSTRAINT friend_contactID_fk FOREIGN KEY (contactID) REFERENCES personal(contactID));

DESCRIBE friend;

/* ----------------------------------------
Create the VENDOR_VENDOR_TYPE table from the VENDOR_VENDOR_TYPE (intersection) relation

VENDOR_VENDOR_TYPE(contactID, vendor_typeID)
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

/* ----------------------------------------
Create the CONTACT_PHONE table from the CONTACT_PHONE (intersection) relation

CONTACT_PHONE(contactID, phone_number)
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
