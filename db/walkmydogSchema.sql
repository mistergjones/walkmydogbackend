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
    state VARCHAR(30) NOT NULL,
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
    state VARCHAR(30) NOT NULL,
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

INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-09-06','1630897200','1630899000','1800','notapplied','notapplied',25,2.5,'FALSE','na','C','no notes',16,2,47);

INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-09-06','1630904400','1630906200','1800','notapplied','notapplied',25,2.5,'FALSE','na','C','no notes',16,2,47);

INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-09-06','1630911600','1630913400','1800','notapplied','notapplied',25,2.5,'FALSE','na','C','no notes',16,2,47);

INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-09-06','1630915200','1630917000','1800','notapplied','notapplied',25,2.5,'FALSE','na','C','no notes',16,2,48);

INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-09-06','1630922400','1630924200','1800','notapplied','notapplied',25,2.5,'FALSE','na','C','no notes',16,2,48);

INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-09-05','1630922400','1630924200','1800','notapplied','notapplied',25,2.5,'FALSE','na','A','no notes',16,2,48);

INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-09-05','1630922400','1630924200','1800','notapplied','notapplied',35,3.5,'FALSE','na','C','no notes',16,3,48);

INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-09-05','1630922400','1630924200','1800','notapplied','notapplied',65,6.5,'FALSE','na','C','no notes',16,4,48);

INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-09-05','1630922400','1630924200','1800','notapplied','notapplied',85,8.5,'FALSE','na','C','no notes',16,5,48);

INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-09-05','1630922400','1630924200','1800','notapplied','notapplied',10,1,'FALSE','na','C','no notes',16,1,48);

INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-09-05','1630922400','1630924200','1800','notapplied','notapplied',10,1,'FALSE','na','C','no notes',16,1,48);

<<<<<<< HEAD
<<<<<<< HEAD
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-09-05','1630922400','1630924200','1800','notapplied','notapplied',10,1,'FALSE','na','C','no notes',18,1,48);

=======
>>>>>>> d5902b4 (Implemented LAT / LNG for owner and walker. State length increased. Valiators Updated. Changes to the backend to incorporate Walker History DB queries etc)
=======
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,walker_assigned,service_id,owner_id) VALUES ('2021-09-05','1630922400','1630924200','1800','notapplied','notapplied',10,1,'FALSE','na','C','no notes',18,1,48);

>>>>>>> 6ce3bba (Changes to walkerSql, models and route walker to support the hostorial walker capability)
Select walkers.firstname, walkers.lastname, bookings.date, bookings.start_time, bookings.duration, bookings.booking_status, dogs.dog_firstname, bookings.service_fee FROM ((walkers INNER JOIN bookings ON walkers.walker_id = bookings.walker_assigned) INNER JOIN dogs ON bookings.owner_id = dogs.owner_id) WHERE walker_id = 16;

SELECT count(*) FROM bookings;


select  walkers.firstname, walkers.suburb, walkers.overall_rating from bookings, walkers where bookings.walker_assigned = walkers.walker_id and booking_status = 'A' and booking_id = 16


SELECT walkers.walker_id, walkers.firstname, walkers.lastname, bookings.date, bookings.start_time, services.service_type, bookings.booking_status, dogs.dog_firstname, bookings.service_fee, owners.suburb FROM ((((walkers INNER JOIN bookings ON walkers.walker_id = bookings.walker_assigned) INNER JOIN dogs ON bookings.owner_id = dogs.owner_id) INNER JOIN services ON bookings.service_id = services.service_id) INNER JOIN owners ON bookings.owner_id = owners.owner_id) WHERE walkers.credential_id = $1 AND booking_status = 'A';