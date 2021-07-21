-- These commands create the required database for our Roster App

-- drop database if it exits
drop database walkmydog;

-- create the database;
create database walkmydog;

-- connect to the database. Note: you need to on the cli psql
\c walkmydog;

CREATE TABLE users
(
    user_id SERIAL PRIMARY KEY NOT NULL,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(100) NOT NULL,
    UNIQUE (email)
);