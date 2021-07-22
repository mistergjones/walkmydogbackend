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
insert into services (service_type, service_fee) VALUES ('60WO', 40);
insert into services (service_type, service_fee) VALUES ('30HV', 20);
insert into services (service_type, service_fee) VALUES ('60HV', 35);



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



-- CREATE USERS
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY NOT NULL,
    firstname VARCHAR(20) NOT NULL,
    lastname VARCHAR(20) NOT NULL,
    street_address VARCHAR(50) NOT NULL,
    town VARCHAR(50) NOT NULL,
    postcode INTEGER NOT NULL,
    mobile VARCHAR(10) NOT NULL,
    email VARCHAR(30) NOT NULL,
    password VARCHAR(20) NOT NULL,
    dob DATE NOT NULL,
    licence_num VARCHAR(10),
    licence_photo VARCHAR(100),
    bankname VARCHAR(20) NOT NULL,
    bankBSB VARCHAR(6) NOT NULL,
    bankAcctNum VARCHAR(10) NOT NULL,
    overall_rating NUMERIC(2,1),
    type VARCHAR(1) NOT NULL,
    walker_30WO INTEGER,
    walker_60WO INTEGER,
    walker_30HV INTEGER,
    walker_60HV INTEGER,
    active_membership BOOLEAN DEFAULT TRUE,
    size_id INTEGER,
    FOREIGN KEY (size_id) REFERENCES sizepreferences(size_id),
    UNIQUE(email),
    UNIQUE(mobile)

);

INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('generic','generic','11 Generic Street','Frankston',3199,'0400999999','gg@ggeneric.com','zzz122','2000-01-05','111111111','notapplied','CBA',063133,12345678,5,'O',0,0,0,0,'TRUE',1);

INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('andre','reid','11 Playne Street','Frankston',3199,'0400000000','ar@areid.com','zzz123','2000-01-01','111111112','notapplied','CBA',063134,12345678,1,'O',0,0,0,0,'TRUE',1);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('paddy','piper','11 Austin Road','Seaford',3198,'0401000001','pp@ppiper.com','zzz124','2000-01-02','111111113','notapplied','CBA',063135,12345678,2,'O',0,0,0,0,'TRUE',1);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('riccardo','goodwin','11 Walkers Road','Carrum',3197,'0401000002','rg@rgoodwin.com','zzz125','2000-01-03','111111114','notapplied','CBA',063136,12345678,3,'O',0,0,0,0,'TRUE',1);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('anushka','jacobson','11 York Street','Mornington',3931,'0401000003','aj@ajacobson.com','zzz126','2000-01-04','111111115','notapplied','CBA',063137,12345678,4,'O',0,0,0,0,'TRUE',1);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('carlton','mora','11 Walkers Road','Mt Eliza',3930,'0401000004','cm@cmora.com','zzz127','2000-01-05','111111116','notapplied','CBA',063138,12345678,5,'O',0,0,0,0,'TRUE',1);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('juliet','morrison','11 Clarendon Street','Thornbury',3071,'0401000005','jm@jmorrison.com','zzz128','2000-01-06','111111117','notapplied','CBA',063139,12345678,1,'O',0,0,0,0,'TRUE',1);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('mckenzie','wheatley','11 Cheddar Road','Reservoir',3073,'0401000006','mw@mwheatley.com','zzz129','2000-01-07','111111118','notapplied','CBA',063140,12345678,2,'O',0,0,0,0,'TRUE',1);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('shuaib','blaese','11 The Blvd','Thomastown',3074,'0401000007','sb@sblaese.com','zzz130','2000-01-08','111111119','notapplied','CBA',063141,12345678,3,'O',0,0,0,0,'TRUE',1);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('portia','jennings','11 Oherns Road','Epping',3076,'0401000008','pj@pjennings.com','zzz131','2000-01-09','111111120','notapplied','NAB',063142,12345678,4,'O',0,0,0,0,'TRUE',1);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('pearl','mohamed','11 Bitburg Street','Jacana',3047,'0401000009','pm@pmohamed.com','zzz132','2000-01-10','111111121','notapplied','NAB',063143,12345678,5,'O',0,0,0,0,'TRUE',1);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('santino','sharpe','12 Playne Street','Frankston',3199,'0401000010','ss@ssharpe.com','zzz133','2000-01-11','111111122','notapplied','NAB',063144,12345678,1,'O',0,0,0,0,'TRUE',1);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('adnaan','truong','12 Austin Road','Seaford',3198,'0401000011','at@atruong.com','zzz134','2000-01-12','111111123','notapplied','NAB',063145,12345678,2,'O',0,0,0,0,'TRUE',1);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('natalia','massey','12 Walkers Road','Carrum',3197,'0401000012','nm@nmassey.com','zzz135','2000-01-13','111111124','notapplied','NAB',063146,12345678,3,'O',0,0,0,0,'TRUE',1);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('zayd','hook','12 York Street','Mornington',3931,'0401000013','zh@zhook.com','zzz136','2000-01-14','111111125','notapplied','NAB',063147,12345678,4,'O',0,0,0,0,'TRUE',1);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('thomas','ramirez','12 Walkers Road','Mt Eliza',3930,'0401000014','tr@tramirez.com','zzz137','2008-01-03','111111126','notapplied','NAB',063148,12345678,5,'O',0,0,0,0,'TRUE',1);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('mikolaj','fischer','12 Clarendon Street','Thornbury',3071,'0401000015','mf@mfischer.com','zzz138','2014-01-04','111111127','notapplied','NAB',063149,12345678,1,'O',0,0,0,0,'TRUE',1);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('mila','hewitt','12 Cheddar Road','Reservoir',3073,'0401000016','mh@mhewitt.com','zzz139','2012-01-05','111111128','notapplied','NAB',063150,12345678,2,'O',0,0,0,0,'TRUE',1);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('marian','talley','12 The Blvd','Thomastown',3074,'0401000017','mt@mtalley.com','zzz140','2000-01-18','111111129','notapplied','NAB',063151,12345678,3,'O',0,0,0,0,'TRUE',1);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('alma','peralta','12 Oherns Road','Epping',3076,'0401000018','ap@aperalta.com','zzz141','2000-01-19','111111130','notapplied','NAB',063152,12345678,4,'O',0,0,0,0,'TRUE',1);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('kacie','wilder','12 Bitburg Street','Jacana',3047,'0401000019','kw@kwilder.com','zzz142','2000-01-01','111111131','notapplied','ANZ',063153,12345678,5,'O',0,0,0,0,'TRUE',1);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('kymani','leonard','13 Playne Street','Frankston',3199,'0401000020','kl@kleonard.com','zzz143','2000-01-02','111111132','notapplied','ANZ',063154,12345678,1,'W',1,0,3,0,'TRUE',2);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('charis','rangel','13 Austin Road','Seaford',3198,'0401000021','cr@crangel.com','zzz144','2000-01-03','111111133','notapplied','ANZ',063155,12345678,2,'W',1,0,3,0,'TRUE',2);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('rupert','copeland','13 Walkers Road','Carrum',3197,'0401000022','rc@rcopeland.com','zzz145','2000-01-04','111111134','notapplied','ANZ',063156,12345678,3,'W',1,0,3,0,'TRUE',2);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('keyan','dickinson','13 York Street','Mornington',3931,'0401000023','kd@kdickinson.com','zzz146','2000-01-05','111111135','notapplied','ANZ',063157,12345678,4,'W',1,2,0,0,'TRUE',3);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('liyah','norton','13 Walkers Road','Mt Eliza',3930,'0401000024','ln@lnorton.com','zzz147','2000-01-06','111111136','notapplied','ANZ',063158,12345678,5,'W',1,2,0,0,'FALSE',3);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('sammy','mellor','13 Clarendon Street','Thornbury',3071,'0401000025','sm@smellor.com','zzz148','2000-01-07','111111137','notapplied','ANZ',063159,12345678,1,'W',1,2,0,0,'FALSE',3);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('dwayne','cottrell','13 Cheddar Road','Reservoir',3073,'0401000026','dc@dcottrell.com','zzz149','2000-01-08','111111138','notapplied','ANZ',063160,12345678,2,'W',1,2,3,0,'TRUE',4);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('brooke','sawyer','13 The Blvd','Thomastown',3074,'0401000027','bs@bsawyer.com','zzz150','2000-01-09','111111139','notapplied','CBA',063161,12345678,3,'W',1,2,3,0,'TRUE',4);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('emilio','mustafa','13 Oherns Road','Epping',3076,'0401000028','em@emustafa.com','zzz151','2000-01-10','111111140','notapplied','CBA',063162,12345678,4,'W',1,2,3,0,'TRUE',4);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('aroush','martin','13 Bitburg Street','Jacana',3047,'0401000029','am@amartin.com','zzz152','2000-01-11','111111141','notapplied','CBA',063163,12345678,5,'W',1,2,3,4,'TRUE',5);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('gordon','thornton','13 Playne Street','Frankston',3199,'0401000030','gt@gthornton.com','zzz153','2000-01-12','111111142','notapplied','CBA',063164,12345678,1,'W',1,2,3,4,'TRUE',5);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('ayub','denton','14 Austin Road','Seaford',3198,'0401000031','ad@adenton.com','zzz154','2000-01-13','111111143','notapplied','CBA',063165,12345678,2,'W',1,2,3,4,'TRUE',5);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('vlad','mayer','14 Walkers Road','Carrum',3197,'0401000032','vm@vmayer.com','zzz155','2000-01-14','111111144','notapplied','CBA',063166,12345678,3,'W',1,2,3,4,'TRUE',6);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('arif','kelly','14 York Street','Mornington',3931,'0401000033','ak@akelly.com','zzz156','2008-01-03','111111145','notapplied','CBA',063167,12345678,4,'W',0,2,3,4,'TRUE',6);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('ceara','mcfarland','14 Walkers Road','Mt Eliza',3930,'0401000034','cm@cmcfarland.com','zzz157','2014-01-04','111111146','notapplied','CBA',063168,12345678,5,'W',0,2,3,4,'TRUE',6);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('chris','mcphee','14 Clarendon Street','Thornbury',3071,'0401000035','cm@cmcphee.com','zzz158','2012-01-05','111111147','notapplied','CBA',063169,12345678,1,'W',0,0,3,4,'TRUE',7);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('gurpreet','cowan','14 Cheddar Road','Reservoir',3073,'0401000036','gc@gcowan.com','zzz159','2000-01-18','111111148','notapplied','CBA',063170,12345678,2,'W',0,0,3,4,'TRUE',7);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('aaliya','henry','14 The Blvd','Thomastown',3074,'0401000037','ah@ahenry.com','zzz160','2000-01-19','111111149','notapplied','CBA',063171,12345678,3,'W',1,0,3,4,'TRUE',8);
INSERT INTO USERS (firstname,lastname,street_address,town,postcode,mobile,email,password,dob,licence_num,licence_photo,bankName,bankBSB,bankAcctNum,overall_rating,type,walker_30WO,walker_60WO,walker_30HV,walker_60HV,active_membership,size_id) VALUES('becky','hayden','14 Oherns Road','Epping',3076,'0401000038','bh@bhayden.com','zzz161','2000-01-01','111111150','notapplied','CBA',063172,12345678,4,'W',1,0,0,4,'TRUE',8);

-- THIS TABLE CREATE DOGS
CREATE TABLE dogs (
dog_id SERIAL PRIMARY KEY NOT NULL,
dog_firstname VARCHAR(20) NOT NULL,
dog_photo VARCHAR(100) NOT NULL,
dog_breed VARCHAR(20) NOT NULL,
dog_size VARCHAR(1) NOT NULL,
dog_always_leashed BOOLEAN DEFAULT TRUE,
user_id INTEGER,
FOREIGN KEY (user_id) REFERENCES users(user_id)
);


-- DOGS DATA

INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('fido','notapplied','sausage','S','TRUE',1);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('charlie','notapplied','alsatian','L','TRUE',2);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('mick','notapplied','mutt','M','FALSE',3);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('jess','notapplied','collie','M','TRUE',4);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('jessie','notapplied','lapdog','S','FALSE',5);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('tito','notapplied','retreiver','L','TRUE',6);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('brutus','notapplied','labrador','L','TRUE',7);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('jen','notapplied','pug','S','FALSE',8);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('tomtom','notapplied','corgi','S','FALSE',9);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('daisy','notapplied','terrier','S','FALSE',10);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('Loki','notapplied','sausage','S','FALSE',11);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('Toki','notapplied','alsatian','L','TRUE',12);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('Miko','notapplied','mutt','M','FALSE',13);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('Joki','notapplied','collie','M','TRUE',14);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('Noki','notapplied','lapdog','S','TRUE',15);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('Roki','notapplied','retreiver','L','TRUE',16);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('Zoki','notapplied','labrador','L','FALSE',17);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('Woki','notapplied','pug','S','TRUE',18);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('Poki','notapplied','corgi','S','FALSE',19);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('Soki','notapplied','terrier','S','TRUE',20);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('fido','notapplied','sausage','S','TRUE',21);

INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('charlie','notapplied','alsatian','L','FALSE',22);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('mick','notapplied','mutt','M','TRUE',23);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('jess','notapplied','collie','M','TRUE',24);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('jessie','notapplied','lapdog','S','FALSE',25);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('tito','notapplied','retreiver','L','TRUE',26);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('brutus','notapplied','labrador','L','FALSE',27);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('jen','notapplied','pug','S','TRUE',28);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('tomtom','notapplied','corgi','S','TRUE',29);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('daisy','notapplied','terrier','S','FALSE',30);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('Loki','notapplied','sausage','S','TRUE',31);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('Toki','notapplied','alsatian','L','FALSE',32);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('Miko','notapplied','mutt','M','TRUE',33);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('Joki','notapplied','collie','M','TRUE',34);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('Noki','notapplied','lapdog','S','FALSE',35);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('Roki','notapplied','retreiver','L','FALSE',36);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('Zoki','notapplied','labrador','L','FALSE',37);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('Woki','notapplied','pug','S','FALSE',38);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('Poki','notapplied','corgi','S','TRUE',39);
INSERT INTO DOGS (dog_firstname, dog_photo, dog_breed, dog_size, dog_always_leashed, user_id) VALUES  ('Soki','notapplied','terrier','S','FALSE',40);
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
    whom_cancelled VARCHAR(20),
    booking_status VARCHAR(1),
    booking_instructions VARCHAR(100),
    service_id INTEGER,
    FOREIGN KEY (service_id) REFERENCES services(service_id),
    dog_id INTEGER,
    FOREIGN KEY (dog_id) REFERENCES dogs(dog_id),
    user_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);


-- BOOKIGNS DATA
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-23','1627030800','1627032600',1800,'blank','blank',25,2.5,'FALSE','na','O','blank',1,1,1);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-23','1627032600','1627034400',1800,'blank','blank',40,4,'FALSE','na','O','blank',2,1,2);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-23','1627034400','1627036200',1800,'blank','blank',20,2,'FALSE','na','O','blank',3,1,3);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-23','1627036200','1627038000',1800,'blank','blank',35,3.5,'FALSE','na','A','blank',4,2,4);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-23','1627038000','1627039800',1800,'blank','blank',25,2.5,'FALSE','na','A','blank',1,3,5);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-23','1627039800','1627041600',1800,'blank','blank',40,4,'FALSE','na','A','blank',2,4,1);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-23','1627041600','1627043400',1800,'blank','blank',20,2,'FALSE','na','F','blank',3,2,2);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-23','1627043400','1627045200',1800,'blank','blank',35,3.5,'FALSE','na','F','blank',4,3,3);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-23','1627045200','1627047000',1800,'blank','blank',25,2.5,'FALSE','na','F','blank',1,4,4);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-23','1627047000','1627048800',1800,'blank','blank',40,4,'FALSE','na','F','blank',2,2,5);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-23','1627048800','1627052400',3600,'blank','blank',20,2,'FALSE','na','F','blank',3,3,1);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-23','1627052400','1627056000',3600,'blank','blank',35,3.5,'FALSE','na','F','blank',4,4,2);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-23','1627056000','1627059600',3600,'blank','blank',25,2.5,'TRUE','1','C','blank',1,2,1);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-23','1627059600','1627063200',3600,'blank','blank',40,4,'TRUE','2','C','blank',2,3,2);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-24','1627117200','1627119000',1800,'blank','blank',25,2.5,'FALSE','na','O','blank',1,1,1);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-24','1627119000','1627120800',1800,'blank','blank',40,4,'FALSE','na','O','blank',2,1,2);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-24','1627120800','1627122600',1800,'blank','blank',20,2,'FALSE','na','O','blank',3,1,3);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-24','1627122600','1627124400',1800,'blank','blank',35,3.5,'FALSE','na','A','blank',4,2,4);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-24','1627124400','1627126200',1800,'blank','blank',25,2.5,'FALSE','na','A','blank',1,3,5);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-24','1627126200','1627128000',1800,'blank','blank',40,4,'FALSE','na','A','blank',2,4,1);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-24','1627128000','1627129800',1800,'blank','blank',20,2,'FALSE','na','F','blank',3,2,2);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-24','1627129800','1627131600',1800,'blank','blank',35,3.5,'FALSE','na','F','blank',4,3,3);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-24','1627131600','1627133400',1800,'blank','blank',25,2.5,'FALSE','na','F','blank',1,4,4);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-24','1627133400','1627135200',1800,'blank','blank',40,4,'FALSE','na','F','blank',2,2,5);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-24','1627135200','1627138800',3600,'blank','blank',20,2,'FALSE','na','F','blank',3,3,1);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-24','1627138800','1627142400',3600,'blank','blank',35,3.5,'FALSE','na','F','blank',4,4,2);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-24','1627142400','1627146000',3600,'blank','blank',25,2.5,'TRUE','1','C','blank',1,2,1);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-24','1627146000','1627149600',3600,'blank','blank',40,4,'TRUE','2','C','blank',2,3,2);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-25','1627203600','1627205400',1800,'blank','blank',25,2.5,'FALSE','na','O','blank',1,1,1);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-25','1627205400','1627207200',1800,'blank','blank',40,4,'FALSE','na','O','blank',2,1,2);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-25','1627207200','1627209000',1800,'blank','blank',20,2,'FALSE','na','O','blank',3,1,3);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-25','1627209000','1627210800',1800,'blank','blank',35,3.5,'FALSE','na','A','blank',4,2,4);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-25','1627210800','1627212600',1800,'blank','blank',25,2.5,'FALSE','na','A','blank',1,3,5);

INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-25','1627212600','1627214400',1800,'blank','blank',40,4,'FALSE','na','A','blank',2,4,1);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-25','1627214400','1627216200',1800,'blank','blank',20,2,'FALSE','na','F','blank',3,2,2);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-25','1627216200','1627218000',1800,'blank','blank',35,3.5,'FALSE','na','F','blank',4,3,3);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-25','1627218000','1627219800',1800,'blank','blank',25,2.5,'FALSE','na','F','blank',1,4,4);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-25','1627219800','1627221600',1800,'blank','blank',40,4,'FALSE','na','F','blank',2,2,5);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-25','1627221600','1627225200',3600,'blank','blank',20,2,'FALSE','na','F','blank',3,3,1);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-25','1627225200','1627228800',3600,'blank','blank',35,3.5,'FALSE','na','F','blank',4,4,2);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-25','1627228800','1627232400',3600,'blank','blank',25,2.5,'TRUE','1','C','blank',1,2,1);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-25','1627232400','1627236000',3600,'blank','blank',40,4,'TRUE','2','C','blank',2,3,2);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-26','1627290000','1627291800',1800,'blank','blank',25,2.5,'FALSE','na','O','blank',1,1,1);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-26','1627291800','1627293600',1800,'blank','blank',40,4,'FALSE','na','O','blank',2,1,2);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-26','1627293600','1627295400',1800,'blank','blank',20,2,'FALSE','na','O','blank',3,1,3);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-26','1627295400','1627297200',1800,'blank','blank',35,3.5,'FALSE','na','A','blank',4,2,4);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-26','1627297200','1627299000',1800,'blank','blank',25,2.5,'FALSE','na','A','blank',1,3,5);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-26','1627299000','1627300800',1800,'blank','blank',40,4,'FALSE','na','A','blank',2,4,1);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-26','1627300800','1627302600',1800,'blank','blank',20,2,'FALSE','na','F','blank',3,2,2);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-26','1627302600','1627304400',1800,'blank','blank',35,3.5,'FALSE','na','F','blank',4,3,3);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-26','1627304400','1627306200',1800,'blank','blank',25,2.5,'FALSE','na','F','blank',1,4,4);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-26','1627306200','1627308000',1800,'blank','blank',40,4,'FALSE','na','F','blank',2,2,5);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-26','1627308000','1627311600',3600,'blank','blank',20,2,'FALSE','na','F','blank',3,3,1);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-26','1627311600','1627315200',3600,'blank','blank',35,3.5,'FALSE','na','F','blank',4,4,2);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-26','1627315200','1627318800',3600,'blank','blank',25,2.5,'TRUE','1','C','blank',1,2,1);
INSERT INTO BOOKINGS (date,start_time,end_time,duration,photo_proof,gps_image,service_fee,our_comission,is_cancelled,whom_cancelled,booking_status,booking_instructions,service_id,dog_id,user_id) VALUES ('2021-07-26','1627318800','1627322400',3600,'blank','blank',40,4,'TRUE','2','C','blank',2,3,2);