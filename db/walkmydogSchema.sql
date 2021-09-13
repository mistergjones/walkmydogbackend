-- These commands create the required database for our Roster App

-- drop database if it exits
drop database walkmydog;

-- create the database;
create database walkmydog;

-- connect to the database. Note: you need to on the cli psql
\c walkmydog;

-- now create the main tables.

-- create the services
CREATE TABLE services (
    service_id SERIAL PRIMARY KEY NOT NULL,
    service_type VARCHAR(4) NOT NULL,
    service_fee NUMERIC(4,2) NOT NULL
);

-- SERVICES DATA
insert into services (service_type, service_fee) VALUES ('na', 0);
insert into services (service_type, service_fee) VALUES ('30WO', 25);
insert into services (service_type, service_fee) VALUES ('30HV', 20);
insert into services (service_type, service_fee) VALUES ('60WO', 40);
insert into services (service_type, service_fee) VALUES ('60HV', 35);
SELECT count(*) FROM services;



CREATE TABLE sizepreferences (
    size_id SERIAL PRIMARY KEY NOT NULL,
    size_preference VARCHAR(3)
);


INSERT INTO sizepreferences (size_preference) VALUES ('LMS');
INSERT INTO sizepreferences (size_preference) VALUES ('LM');
INSERT INTO sizepreferences (size_preference) VALUES ('LS');
INSERT INTO sizepreferences (size_preference) VALUES ('L');
INSERT INTO sizepreferences (size_preference) VALUES ('MS');
INSERT INTO sizepreferences (size_preference) VALUES ('ML');
INSERT INTO sizepreferences (size_preference) VALUES ('M');
INSERT INTO sizepreferences (size_preference) VALUES ('S');
INSERT INTO sizepreferences (size_preference) VALUES ('NA');
SELECT count(*) FROM sizepreferences;



-- CREATE CREDENTIALS
CREATE TABLE credentials (
    credential_id SERIAL PRIMARY KEY NOT NULL,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(60) NOT NULL,
    type VARCHAR(1) NOT NULL,
    is_profile_established BOOLEAN DEFAULT FALSE,
    UNIQUE(email)
);

-- CREATE CREDENTIAL DATA
-- SELECT count(*) FROM credentials;

-- CREATE OWNERS
CREATE TABLE owners (
    owner_id SERIAL PRIMARY KEY NOT NULL,
    firstname VARCHAR(20) NOT NULL,
    lastname VARCHAR(20) NOT NULL,
    street_address VARCHAR(50) NOT NULL,
    suburb VARCHAR(50) NOT NULL,
    state VARCHAR(20) NOT NULL,
    postcode INTEGER NOT NULL,
    mobile VARCHAR(10) NOT NULL,
    email VARCHAR(50) NOT NULL,
    dob DATE NOT NULL,
    licence_num VARCHAR(10),
    licence_photo VARCHAR(100),
    bank_name VARCHAR(50) NOT NULL ,
    bank_BSB VARCHAR(6) NOT NULL ,
    bank_acct_num VARCHAR(10),
    overall_rating NUMERIC(2,1),
    type VARCHAR(1) NOT NULL,
    active_membership BOOLEAN DEFAULT TRUE,
    lat NUMERIC(9,6),
    lng NUMERIC(9,6),
    credential_id INTEGER, 
    FOREIGN KEY (credential_id) REFERENCES credentials(credential_id),
    UNIQUE(email),
    UNIQUE(mobile)
);

-- OWNERS DATA
-- SELECT count(*) FROM owners;

-- CREATE WALKERS
CREATE TABLE walkers (
    walker_id SERIAL PRIMARY KEY NOT NULL,
    firstname VARCHAR(20) NOT NULL,
    lastname VARCHAR(20) NOT NULL,
    street_address VARCHAR(50) NOT NULL,
    suburb VARCHAR(50) NOT NULL,
    state VARCHAR(20) NOT NULL,
    postcode INTEGER NOT NULL,
    mobile VARCHAR(10) NOT NULL,
    email VARCHAR(50) NOT NULL,
    dob DATE NOT NULL,
    licence_num VARCHAR(10),
    licence_photo VARCHAR(100),
    bank_name VARCHAR(20) NOT NULL,
    bank_BSB VARCHAR(6) NOT NULL,
    bank_acct_num VARCHAR(10) NOT NULL,
    overall_rating NUMERIC(2,1),
    type VARCHAR(1) NOT NULL,
    walker_30WO INTEGER,
    walker_30HV INTEGER,
    walker_60WO INTEGER,
    walker_60HV INTEGER,
    active_membership BOOLEAN DEFAULT TRUE,
    lat NUMERIC(9,6),
    lng NUMERIC(9,6),
    size_id INTEGER,
    FOREIGN KEY (size_id) REFERENCES sizepreferences(size_id),
    credential_id INTEGER, 
    FOREIGN KEY (credential_id) REFERENCES credentials(credential_id),
    UNIQUE(email),
    UNIQUE(mobile)
);
​

-- SELECT count(*) FROM walkers;



-- THIS TABLE CREATE DOGS
CREATE TABLE dogs (
dog_id SERIAL PRIMARY KEY NOT NULL,
dog_firstname VARCHAR(20) NOT NULL,
dog_photo VARCHAR(100) NOT NULL,
dog_breed VARCHAR(20) NOT NULL,
dog_size VARCHAR(1) NOT NULL,
dog_always_leashed VARCHAR(3) NOT NULL,
owner_id INTEGER,
FOREIGN KEY (owner_id) REFERENCES owners(owner_id)
);


-- DOGS DATA
-- SELECT count(*) FROM dogs;


-- create the bookings
CREATE TABLE bookings (
    booking_id SERIAL PRIMARY KEY NOT NULL,
    date DATE NOT NULL,
    start_time BIGINT NOT NULL,
    end_time BIGINT NOT NULL,
    duration INTEGER NOT NULL,
    photo_proof VARCHAR(100),
    gps_image VARCHAR(100),
    service_fee NUMERIC(8,2) NOT NULL,
    our_comission NUMERIC(8,2) NOT NULL,
    is_cancelled BOOLEAN DEFAULT FALSE,
    whom_cancelled VARCHAR(6),
    booking_status VARCHAR(1),
    booking_instructions VARCHAR(100),
    walker_assigned INTEGER,
    service_id INTEGER,
    FOREIGN KEY (service_id) REFERENCES services (service_id),
    owner_id INTEGER,
    FOREIGN KEY (owner_id) REFERENCES owners (owner_id)
);


-- BOOKIGNS DATA
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-07-26','1627254000','1627255800','1800','notapplied','notapplied',25,2.5,'FALSE','na','F','no notes',1,2,1);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-07-26','1627255800','1627257600','1800','notapplied','notapplied',25,2.5,'FALSE','na','F','no notes',2,2,2);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-07-26','1627257600','1627259400','1800','notapplied','notapplied',25,2.5,'FALSE','na','F','no notes',3,2,3);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-07-26','1627259400','1627261200','1800','notapplied','notapplied',25,2.5,'FALSE','na','F','no notes',4,2,4);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-07-26','1627261200','1627263000','1800','notapplied','notapplied',25,2.5,'FALSE','na','F','no notes',5,2,5);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-07-26','1627263000','1627264800','1800','notapplied','notapplied',0,0,'TRUE','6','C','no notes',6,2,6);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-07-26','1627264800','1627266600','1800','notapplied','notapplied',0,0,'TRUE','7','C','no notes',7,2,7);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-07-26','1627266600','1627268400','1800','notapplied','notapplied',0,0,'TRUE','8','C','no notes',8,2,8);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-07-26','1627268400','1627270200','1800','notapplied','notapplied',0,0,'TRUE','29','C','no notes',9,2,9);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-07-26','1627270200','1627272000','1800','notapplied','notapplied',0,0,'TRUE','30','C','no notes',10,2,10);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-07-26','1627272000','1627275600','3600','notapplied','notapplied',40,4,'FALSE','na','F','no notes',11,4,11);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-07-26','1627275600','1627279200','3600','notapplied','notapplied',40,4,'FALSE','na','F','no notes',12,4,12);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-07-26','1627279200','1627282800','3600','notapplied','notapplied',40,4,'FALSE','na','O','no notes',0,1,13);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-07-26','1627282800','1627286400','3600','notapplied','notapplied',40,4,'FALSE','na','O','no notes',0,1,14);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-07-30','1627599600','1627601400','1800','notapplied','notapplied',25,2.5,'FALSE','na','A','no notes',1,2,1);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-07-30','1627601400','1627603200','1800','notapplied','notapplied',25,2.5,'FALSE','na','A','no notes',2,2,2);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-07-30','1627603200','1627605000','1800','notapplied','notapplied',25,2.5,'FALSE','na','A','no notes',3,2,3);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-07-30','1627605000','1627606800','1800','notapplied','notapplied',25,2.5,'FALSE','na','A','no notes',4,2,4);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-07-30','1627606800','1627608600','1800','notapplied','notapplied',25,2.5,'FALSE','na','A','no notes',5,2,5);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-07-30','1627608600','1627610400','1800','notapplied','notapplied',25,2.5,'FALSE','na','A','no notes',6,2,6);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-07-30','1627610400','1627612200','1800','notapplied','notapplied',25,2.5,'FALSE','na','A','no notes',7,2,7);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-07-30','1627612200','1627614000','1800','notapplied','notapplied',25,2.5,'FALSE','na','A','no notes',8,2,8);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-07-30','1627614000','1627615800','1800','notapplied','notapplied',25,2.5,'FALSE','na','A','no notes',9,2,9);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-07-30','1627615800','1627617600','1800','notapplied','notapplied',25,2.5,'FALSE','na','A','no notes',10,2,10);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-07-30','1627617600','1627621200','3600','notapplied','notapplied',40,4,'FALSE','na','A','no notes',11,4,11);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-07-30','1627621200','1627624800','3600','notapplied','notapplied',40,4,'FALSE','na','A','no notes',12,4,12);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-07-30','1627624800','1627628400','3600','notapplied','notapplied',40,4,'FALSE','na','O','no notes',0,1,13);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-07-30','1627628400','1627632000','3600','notapplied','notapplied',40,4,'FALSE','na','O','no notes',0,1,14);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-08-03','1627945200','1627947000','1800','notapplied','notapplied',20,2,'FALSE','na','A','no notes',4,3,1);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-08-03','1627947000','1627948800','1800','notapplied','notapplied',20,2,'FALSE','na','A','no notes',5,3,2);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-08-03','1627948800','1627950600','1800','notapplied','notapplied',20,2,'FALSE','na','A','no notes',6,3,3);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-08-03','1627950600','1627952400','1800','notapplied','notapplied',20,2,'FALSE','na','A','no notes',7,3,4);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-08-03','1627952400','1627954200','1800','notapplied','notapplied',20,2,'FALSE','na','A','no notes',8,3,5);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-08-03','1627954200','1627956000','1800','notapplied','notapplied',20,2,'FALSE','na','A','no notes',9,3,6);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-08-03','1627956000','1627957800','1800','notapplied','notapplied',20,2,'FALSE','na','A','no notes',10,3,7);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-08-03','1627957800','1627959600','1800','notapplied','notapplied',20,2,'FALSE','na','A','no notes',11,3,8);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-08-03','1627959600','1627961400','1800','notapplied','notapplied',20,2,'FALSE','na','A','no notes',12,3,9);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-08-03','1627961400','1627963200','1800','notapplied','notapplied',20,2,'FALSE','na','A','no notes',13,3,10);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-08-03','1627963200','1627966800','3600','notapplied','notapplied',35,3.5,'FALSE','na','A','no notes',19,5,11);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-08-03','1627966800','1627970400','3600','notapplied','notapplied',35,3.5,'FALSE','na','A','no notes',20,5,12);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-08-03','1627970400','1627974000','3600','notapplied','notapplied',35,3.5,'FALSE','na','O','no notes',0,1,13);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-08-03','1627974000','1627977600','3600','notapplied','notapplied',35,3.5,'FALSE','na','O','no notes',0,1,14);
SELECT count(*) FROM bookings;


select  walkers.firstname, walkers.suburb, walkers.overall_rating from bookings, walkers where bookings.walker_assigned = walkers.walker_id and booking_status = 'A' and booking_id = 16