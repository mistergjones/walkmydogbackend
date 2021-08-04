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


INSERT INTO sizepreferences (size_preference) VALUES ('SML');
INSERT INTO sizepreferences (size_preference) VALUES ('S');
INSERT INTO sizepreferences (size_preference) VALUES ('M');
INSERT INTO sizepreferences (size_preference) VALUES ('L');
INSERT INTO sizepreferences (size_preference) VALUES ('S&M');
INSERT INTO sizepreferences (size_preference) VALUES ('M&L');
INSERT INTO sizepreferences (size_preference) VALUES ('S&L');
INSERT INTO sizepreferences (size_preference) VALUES ('NA');
SELECT count(*) FROM sizepreferences;



-- CREATE CREDENTIALS
CREATE TABLE credentials (
    credential_id SERIAL PRIMARY KEY NOT NULL,
    email VARCHAR(20) NOT NULL,
    password VARCHAR(60) NOT NULL,
    type VARCHAR(1) NOT NULL
);

-- CREATE CREDENTIAL DATA
INSERT INTO CREDENTIALS (email, password,type) values ('ar@areid.com','111','O');
INSERT INTO CREDENTIALS (email, password,type) values ('pp@ppiper.com','111','O');
INSERT INTO CREDENTIALS (email, password,type) values ('rg@rgoodwin.com','111','O');
INSERT INTO CREDENTIALS (email, password,type) values ('aj@ajacobson.com','111','O');
INSERT INTO CREDENTIALS (email, password,type) values ('cm@cmora.com','111','O');
INSERT INTO CREDENTIALS (email, password,type) values ('jm@jmorrison.com','111','O');
INSERT INTO CREDENTIALS (email, password,type) values ('mw@mwheatley.com','111','O');
INSERT INTO CREDENTIALS (email, password,type) values ('sb@sblaese.com','111','O');
INSERT INTO CREDENTIALS (email, password,type) values ('pj@pjennings.com','111','O');
INSERT INTO CREDENTIALS (email, password,type) values ('pm@pmohamed.com','111','O');
INSERT INTO CREDENTIALS (email, password,type) values ('ss@ssharpe.com','111','O');
INSERT INTO CREDENTIALS (email, password,type) values ('at@atruong.com','111','O');
INSERT INTO CREDENTIALS (email, password,type) values ('nm@nmassey.com','111','O');
INSERT INTO CREDENTIALS (email, password,type) values ('zh@zhook.com','111','O');
INSERT INTO CREDENTIALS (email, password,type) values ('tr@tramirez.com','111','O');
INSERT INTO CREDENTIALS (email, password,type) values ('mf@mfischer.com','111','O');
INSERT INTO CREDENTIALS (email, password,type) values ('mh@mhewitt.com','111','O');
INSERT INTO CREDENTIALS (email, password,type) values ('mt@mtalley.com','111','O');
INSERT INTO CREDENTIALS (email, password,type) values ('ap@aperalta.com','111','O');
INSERT INTO CREDENTIALS (email, password,type) values ('kw@kwilder.com','111','O');
INSERT INTO CREDENTIALS (email, password,type) values ('kl@kleonard.com','111','W');
INSERT INTO CREDENTIALS (email, password,type) values ('cr@crangel.com','111','W');
INSERT INTO CREDENTIALS (email, password,type) values ('rc@rcopeland.com','111','W');
INSERT INTO CREDENTIALS (email, password,type) values ('kd@kdickinson.com','111','W');
INSERT INTO CREDENTIALS (email, password,type) values ('ln@lnorton.com','111','W');
INSERT INTO CREDENTIALS (email, password,type) values ('sm@smellor.com','111','W');
INSERT INTO CREDENTIALS (email, password,type) values ('dc@dcottrell.com','111','W');
INSERT INTO CREDENTIALS (email, password,type) values ('bs@bsawyer.com','111','W');
INSERT INTO CREDENTIALS (email, password,type) values ('em@emustafa.com','111','W');
INSERT INTO CREDENTIALS (email, password,type) values ('am@amartin.com','111','W');
INSERT INTO CREDENTIALS (email, password,type) values ('gt@gthornton.com','111','W');
INSERT INTO CREDENTIALS (email, password,type) values ('ad@adenton.com','111','W');
INSERT INTO CREDENTIALS (email, password,type) values ('vm@vmayer.com','111','W');
INSERT INTO CREDENTIALS (email, password,type) values ('ak@akelly.com','111','W');
INSERT INTO CREDENTIALS (email, password,type) values ('cm@cmcfarland.com','111','W');
INSERT INTO CREDENTIALS (email, password,type) values ('cm@cmcphee.com','111','W');
INSERT INTO CREDENTIALS (email, password,type) values ('gc@gcowan.com','111','W');
INSERT INTO CREDENTIALS (email, password,type) values ('ah@ahenry.com','111','W');
INSERT INTO CREDENTIALS (email, password,type) values ('bh@bhayden.com','111','W');
INSERT INTO CREDENTIALS (email, password,type) values ('lb@lbyers.com','111','W');
SELECT count(*) FROM credentials;

-- CREATE OWNERS
CREATE TABLE owners (
    owner_id SERIAL PRIMARY KEY NOT NULL,
    firstname VARCHAR(20) NOT NULL,
    lastname VARCHAR(20) NOT NULL,
    street_address VARCHAR(50) NOT NULL,
    suburb VARCHAR(50) NOT NULL,
    postcode INTEGER NOT NULL,
    mobile VARCHAR(10) NOT NULL,
    email VARCHAR(30) NOT NULL,
    dob DATE NOT NULL,
    licence_num VARCHAR(10),
    licence_photo VARCHAR(100),
    bank_name VARCHAR(20) NOT NULL,
    bank_BSB VARCHAR(6) NOT NULL,
    bank_acct_num VARCHAR(10) NOT NULL,
    overall_rating NUMERIC(2,1),
    type VARCHAR(1) NOT NULL,
    active_membership BOOLEAN DEFAULT TRUE,
    credential_id INTEGER, 
    FOREIGN KEY (credential_id) REFERENCES credentials(credential_id),
    UNIQUE(email),
    UNIQUE(mobile)
);

-- OWNERS DATA
INSERT INTO OWNERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,active_membership,credential_id) VALUES ('andre','reid','11 Playne Street','Frankston',3199,'0400000000','ar@areid.com','1970-09-25','111111112','notapplied','CBA','063134','12345678',1,'O',TRUE,1);
INSERT INTO OWNERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,active_membership,credential_id) VALUES ('paddy','piper','11 Austin Road','Seaford',3198,'0401000001','pp@ppiper.com','1970-09-26','111111113','notapplied','CBA','063135','12345678',2,'O',TRUE,2);
INSERT INTO OWNERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,active_membership,credential_id) VALUES ('riccardo','goodwin','11 Walkers Road','Carrum',3197,'0401000002','rg@rgoodwin.com','1970-09-27','111111114','notapplied','CBA','063136','12345678',3,'O',TRUE,3);
INSERT INTO OWNERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,active_membership,credential_id) VALUES ('anushka','jacobson','11 York Street','Mornington',3931,'0401000003','aj@ajacobson.com','1970-09-28','111111115','notapplied','CBA','063137','12345678',4,'O',TRUE,4);
INSERT INTO OWNERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,active_membership,credential_id) VALUES ('carlton','mora','11 Walkers Road','Mt Eliza',3930,'0401000004','cm@cmora.com','1970-09-29','111111116','notapplied','CBA','063138','12345678',5,'O',TRUE,5);
INSERT INTO OWNERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,active_membership,credential_id) VALUES ('juliet','morrison','11 Clarendon Street','Thornbury',3071,'0401000005','jm@jmorrison.com','1970-09-30','111111117','notapplied','CBA','063139','12345678',1,'O',TRUE,6);
INSERT INTO OWNERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,active_membership,credential_id) VALUES ('mckenzie','wheatley','11 Cheddar Road','Reservoir',3073,'0401000006','mw@mwheatley.com','1970-10-01','111111118','notapplied','CBA','063140','12345678',2,'O',TRUE,7);
INSERT INTO OWNERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,active_membership,credential_id) VALUES ('shuaib','blaese','11 The Blvd','Thomastown',3074,'0401000007','sb@sblaese.com','1970-10-02','111111119','notapplied','CBA','063141','12345678',3,'O',TRUE,8);
INSERT INTO OWNERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,active_membership,credential_id) VALUES ('portia','jennings','11 Oherns Road','Epping',3076,'0401000008','pj@pjennings.com','1970-10-03','111111120','notapplied','NAB','063142','12345678',4,'O',TRUE,9);
INSERT INTO OWNERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,active_membership,credential_id) VALUES ('pearl','mohamed','11 Bitburg Street','Jacana',3047,'0401000009','pm@pmohamed.com','1970-10-04','111111121','notapplied','NAB','063143','12345678',5,'O',TRUE,10);
INSERT INTO OWNERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,active_membership,credential_id) VALUES ('santino','sharpe','12 Playne Street','Frankston',3199,'0401000010','ss@ssharpe.com','1970-10-05','111111122','notapplied','NAB','063144','12345678',1,'O',TRUE,11);
INSERT INTO OWNERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,active_membership,credential_id) VALUES ('adnaan','truong','12 Austin Road','Seaford',3198,'0401000011','at@atruong.com','1970-10-06','111111123','notapplied','NAB','063145','12345678',2,'O',TRUE,12);
INSERT INTO OWNERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,active_membership,credential_id) VALUES ('natalia','massey','12 Walkers Road','Carrum',3197,'0401000012','nm@nmassey.com','1970-10-07','111111124','notapplied','NAB','063146','12345678',3,'O',TRUE,13);
INSERT INTO OWNERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,active_membership,credential_id) VALUES ('zayd','hook','12 York Street','Mornington',3931,'0401000013','zh@zhook.com','1970-10-08','111111125','notapplied','NAB','063147','12345678',4,'O',TRUE,14);
INSERT INTO OWNERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,active_membership,credential_id) VALUES ('thomas','ramirez','12 Walkers Road','Mt Eliza',3930,'0401000014','tr@tramirez.com','1970-10-09','111111126','notapplied','NAB','063148','12345678',5,'O',TRUE,15);
INSERT INTO OWNERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,active_membership,credential_id) VALUES ('mikolaj','fischer','12 Clarendon Street','Thornbury',3071,'0401000015','mf@mfischer.com','1970-10-10','111111127','notapplied','NAB','063149','12345678',1,'O',TRUE,16);
INSERT INTO OWNERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,active_membership,credential_id) VALUES ('mila','hewitt','12 Cheddar Road','Reservoir',3073,'0401000016','mh@mhewitt.com','1970-10-11','111111128','notapplied','NAB','063150','12345678',2,'O',TRUE,17);
INSERT INTO OWNERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,active_membership,credential_id) VALUES ('marian','talley','12 The Blvd','Thomastown',3074,'0401000017','mt@mtalley.com','1970-10-12','111111129','notapplied','NAB','063151','12345678',3,'O',TRUE,18);
INSERT INTO OWNERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,active_membership,credential_id) VALUES ('alma','peralta','12 Oherns Road','Epping',3076,'0401000018','ap@aperalta.com','1970-10-13','111111130','notapplied','NAB','063152','12345678',4,'O',TRUE,19);
INSERT INTO OWNERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,active_membership,credential_id) VALUES ('kacie','wilder','12 Bitburg Street','Jacana',3047,'0401000019','kw@kwilder.com','1970-10-14','111111131','notapplied','ANZ','063153','12345678',5,'O',TRUE,20);
SELECT count(*) FROM owners;



-- CREATE WALKERS
CREATE TABLE walkers (
    walker_id SERIAL PRIMARY KEY NOT NULL,
    firstname VARCHAR(20) NOT NULL,
    lastname VARCHAR(20) NOT NULL,
    street_address VARCHAR(50) NOT NULL,
    suburb VARCHAR(50) NOT NULL,
    postcode INTEGER NOT NULL,
    mobile VARCHAR(10) NOT NULL,
    email VARCHAR(30) NOT NULL,
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
    size_id INTEGER,
    FOREIGN KEY (size_id) REFERENCES sizepreferences(size_id),
    credential_id INTEGER, 
    FOREIGN KEY (credential_id) REFERENCES credentials(credential_id),
    UNIQUE(email),
    UNIQUE(mobile)
);


INSERT INTO WALKERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,walker_30WO,walker_30HV,walker_60WO,walker_60HV,active_membership,size_id,credential_id) VALUES ('kymani','leonard','13 Playne Street','Frankston',3199,'0401000020','kl@kleonard.com','1980-09-25','111111132','notapplied','ANZ','063154','12345678',1,'W',2,0,4,0,'TRUE',1,21);
INSERT INTO WALKERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,walker_30WO,walker_30HV,walker_60WO,walker_60HV,active_membership,size_id,credential_id) VALUES ('charis','rangel','13 Austin Road','Seaford',3198,'0401000021','cr@crangel.com','1980-09-26','111111133','notapplied','ANZ','063155','12345679',2,'W',2,0,4,0,'TRUE',1,22);
INSERT INTO WALKERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,walker_30WO,walker_30HV,walker_60WO,walker_60HV,active_membership,size_id,credential_id) VALUES ('rupert','copeland','13 Walkers Road','Carrum',3197,'0401000022','rc@rcopeland.com','1980-09-27','111111134','notapplied','ANZ','063156','12345680',3,'W',2,0,4,0,'TRUE',1,23);
INSERT INTO WALKERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,walker_30WO,walker_30HV,walker_60WO,walker_60HV,active_membership,size_id,credential_id) VALUES ('keyan','dickinson','13 York Street','Mornington',3931,'0401000023','kd@kdickinson.com','1980-09-28','111111135','notapplied','ANZ','063157','12345681',4,'W',2,3,0,0,'TRUE',2,24);
INSERT INTO WALKERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,walker_30WO,walker_30HV,walker_60WO,walker_60HV,active_membership,size_id,credential_id) VALUES ('liyah','norton','13 Walkers Road','Mt Eliza',3930,'0401000024','ln@lnorton.com','1980-09-29','111111136','notapplied','ANZ','063158','12345682',5,'W',2,3,0,0,'TRUE',2,25);
INSERT INTO WALKERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,walker_30WO,walker_30HV,walker_60WO,walker_60HV,active_membership,size_id,credential_id) VALUES ('sammy','mellor','13 Clarendon Street','Thornbury',3071,'0401000025','sm@smellor.com','1980-09-30','111111137','notapplied','ANZ','063159','12345683',1,'W',2,3,0,0,'TRUE',2,26);
INSERT INTO WALKERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,walker_30WO,walker_30HV,walker_60WO,walker_60HV,active_membership,size_id,credential_id) VALUES ('dwayne','cottrell','13 Cheddar Road','Reservoir',3073,'0401000026','dc@dcottrell.com','1980-10-01','111111138','notapplied','ANZ','063160','12345684',2,'W',2,3,4,0,'TRUE',3,27);
INSERT INTO WALKERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,walker_30WO,walker_30HV,walker_60WO,walker_60HV,active_membership,size_id,credential_id) VALUES ('brooke','sawyer','13 The Blvd','Thomastown',3074,'0401000027','bs@bsawyer.com','1980-10-02','111111139','notapplied','CBA','063161','12345685',3,'W',2,3,4,0,'TRUE',3,28);
INSERT INTO WALKERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,walker_30WO,walker_30HV,walker_60WO,walker_60HV,active_membership,size_id,credential_id) VALUES ('emilio','mustafa','13 Oherns Road','Epping',3076,'0401000028','em@emustafa.com','1980-10-03','111111140','notapplied','CBA','063162','12345686',4,'W',2,3,4,0,'TRUE',3,29);
INSERT INTO WALKERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,walker_30WO,walker_30HV,walker_60WO,walker_60HV,active_membership,size_id,credential_id) VALUES ('aroush','martin','13 Bitburg Street','Jacana',3047,'0401000029','am@amartin.com','1980-10-04','111111141','notapplied','CBA','063163','12345687',5,'W',2,3,4,5,'TRUE',4,30);
INSERT INTO WALKERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,walker_30WO,walker_30HV,walker_60WO,walker_60HV,active_membership,size_id,credential_id) VALUES ('gordon','thornton','13 Playne Street','Frankston',3199,'0401000030','gt@gthornton.com','1980-10-05','111111142','notapplied','CBA','063164','12345688',1,'W',2,3,4,5,'TRUE',4,31);
INSERT INTO WALKERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,walker_30WO,walker_30HV,walker_60WO,walker_60HV,active_membership,size_id,credential_id) VALUES ('ayub','denton','14 Austin Road','Seaford',3198,'0401000031','ad@adenton.com','1980-10-06','111111143','notapplied','CBA','063165','12345689',2,'W',2,3,4,5,'TRUE',4,32);
INSERT INTO WALKERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,walker_30WO,walker_30HV,walker_60WO,walker_60HV,active_membership,size_id,credential_id) VALUES ('vlad','mayer','14 Walkers Road','Carrum',3197,'0401000032','vm@vmayer.com','1980-10-07','111111144','notapplied','CBA','063166','12345690',3,'W',2,3,4,5,'TRUE',5,33);
INSERT INTO WALKERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,walker_30WO,walker_30HV,walker_60WO,walker_60HV,active_membership,size_id,credential_id) VALUES ('arif','kelly','14 York Street','Mornington',3931,'0401000033','ak@akelly.com','1980-10-08','111111145','notapplied','CBA','063167','12345691',4,'W',0,3,4,5,'TRUE',5,34);
INSERT INTO WALKERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,walker_30WO,walker_30HV,walker_60WO,walker_60HV,active_membership,size_id,credential_id) VALUES ('ceara','mcfarland','14 Walkers Road','Mt Eliza',3930,'0401000034','cm@cmcfarland.com','1980-10-09','111111146','notapplied','CBA','063168','12345692',5,'W',0,3,4,5,'TRUE',5,35);
INSERT INTO WALKERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,walker_30WO,walker_30HV,walker_60WO,walker_60HV,active_membership,size_id,credential_id) VALUES ('chris','mcphee','14 Clarendon Street','Thornbury',3071,'0401000035','cm@cmcphee.com','1980-10-10','111111147','notapplied','CBA','063169','12345693',1,'W',0,0,4,5,'TRUE',6,36);
INSERT INTO WALKERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,walker_30WO,walker_30HV,walker_60WO,walker_60HV,active_membership,size_id,credential_id) VALUES ('gurpreet','cowan','14 Cheddar Road','Reservoir',3073,'0401000036','gc@gcowan.com','1980-10-11','111111148','notapplied','CBA','063170','12345694',2,'W',0,0,4,5,'TRUE',6,37);
INSERT INTO WALKERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,walker_30WO,walker_30HV,walker_60WO,walker_60HV,active_membership,size_id,credential_id) VALUES ('aaliya','henry','14 The Blvd','Thomastown',3074,'0401000037','ah@ahenry.com','1980-10-12','111111149','notapplied','CBA','063171','12345695',3,'W',2,0,4,5,'TRUE',7,38);
INSERT INTO WALKERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,walker_30WO,walker_30HV,walker_60WO,walker_60HV,active_membership,size_id,credential_id) VALUES ('becky','hayden','14 Oherns Road','Epping',3076,'0401000038','bh@bhayden.com','1980-10-13','111111150','notapplied','CBA','063172','12345696',4,'W',2,0,0,5,'TRUE',7,39);
INSERT INTO WALKERS (firstname,lastname,street_address,suburb,postcode,mobile,email,dob,licence_num,licence_photo,bank_name,bank_BSB,bank_acct_num,overall_rating,type,walker_30WO,walker_30HV,walker_60WO,walker_60HV,active_membership,size_id,credential_id) VALUES ('lili','byers','14 Bitburg Street','Jacana',3047,'0401000039','lb@lbyers.com','1980-10-14','111111151','notapplied','CBA','063173','12345697',5,'W',2,0,0,5,'TRUE',8,40);
SELECT count(*) FROM walkers;



-- THIS TABLE CREATE DOGS
CREATE TABLE dogs (
dog_id SERIAL PRIMARY KEY NOT NULL,
dog_firstname VARCHAR(20) NOT NULL,
dog_photo VARCHAR(100) NOT NULL,
dog_breed VARCHAR(20) NOT NULL,
dog_size VARCHAR(1) NOT NULL,
dog_always_leashed BOOLEAN DEFAULT TRUE,
owner_id INTEGER,
FOREIGN KEY (owner_id) REFERENCES owners(owner_id)
);


-- DOGS DATA
INSERT INTO DOGS (dog_firstname,dog_photo,dog_breed,dog_size,dog_always_leashed,owner_id) VALUES ('fido','notfilled','sausage','S','TRUE',1);
INSERT INTO DOGS (dog_firstname,dog_photo,dog_breed,dog_size,dog_always_leashed,owner_id) VALUES ('charlie','notfilled','alsatian','L','TRUE',2);
INSERT INTO DOGS (dog_firstname,dog_photo,dog_breed,dog_size,dog_always_leashed,owner_id) VALUES ('mick','notfilled','mutt','M','TRUE',3);
INSERT INTO DOGS (dog_firstname,dog_photo,dog_breed,dog_size,dog_always_leashed,owner_id) VALUES ('jess','notfilled','collie','M','TRUE',4);
INSERT INTO DOGS (dog_firstname,dog_photo,dog_breed,dog_size,dog_always_leashed,owner_id) VALUES ('jessie','notfilled','lapdog','S','TRUE',5);
INSERT INTO DOGS (dog_firstname,dog_photo,dog_breed,dog_size,dog_always_leashed,owner_id) VALUES ('tito','notfilled','retreiver','L','TRUE',6);
INSERT INTO DOGS (dog_firstname,dog_photo,dog_breed,dog_size,dog_always_leashed,owner_id) VALUES ('brutus','notfilled','labrador','L','TRUE',7);
INSERT INTO DOGS (dog_firstname,dog_photo,dog_breed,dog_size,dog_always_leashed,owner_id) VALUES ('jen','notfilled','pug','S','TRUE',8);
INSERT INTO DOGS (dog_firstname,dog_photo,dog_breed,dog_size,dog_always_leashed,owner_id) VALUES ('tomtom','notfilled','corgi','S','TRUE',9);
INSERT INTO DOGS (dog_firstname,dog_photo,dog_breed,dog_size,dog_always_leashed,owner_id) VALUES ('daisy','notfilled','terrier','S','TRUE',10);
INSERT INTO DOGS (dog_firstname,dog_photo,dog_breed,dog_size,dog_always_leashed,owner_id) VALUES ('Loki','notfilled','sausage','S','FALSE',11);
INSERT INTO DOGS (dog_firstname,dog_photo,dog_breed,dog_size,dog_always_leashed,owner_id) VALUES ('Toki','notfilled','alsatian','L','FALSE',12);
INSERT INTO DOGS (dog_firstname,dog_photo,dog_breed,dog_size,dog_always_leashed,owner_id) VALUES ('Miko','notfilled','mutt','M','FALSE',13);
INSERT INTO DOGS (dog_firstname,dog_photo,dog_breed,dog_size,dog_always_leashed,owner_id) VALUES ('Joki','notfilled','collie','M','FALSE',14);
INSERT INTO DOGS (dog_firstname,dog_photo,dog_breed,dog_size,dog_always_leashed,owner_id) VALUES ('Noki','notfilled','lapdog','S','FALSE',15);
INSERT INTO DOGS (dog_firstname,dog_photo,dog_breed,dog_size,dog_always_leashed,owner_id) VALUES ('Roki','notfilled','retreiver','L','FALSE',16);
INSERT INTO DOGS (dog_firstname,dog_photo,dog_breed,dog_size,dog_always_leashed,owner_id) VALUES ('Zoki','notfilled','labrador','L','FALSE',17);
INSERT INTO DOGS (dog_firstname,dog_photo,dog_breed,dog_size,dog_always_leashed,owner_id) VALUES ('Woki','notfilled','pug','S','FALSE',18);
INSERT INTO DOGS (dog_firstname,dog_photo,dog_breed,dog_size,dog_always_leashed,owner_id) VALUES ('Poki','notfilled','corgi','S','FALSE',19);
INSERT INTO DOGS (dog_firstname,dog_photo,dog_breed,dog_size,dog_always_leashed,owner_id) VALUES ('Soki','notfilled','terrier','S','FALSE',20);
SELECT count(*) FROM dogs;


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