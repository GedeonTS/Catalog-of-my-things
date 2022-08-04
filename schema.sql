CREATE DATABASE catalog_of_thing;

CREATE TABLE author(
  ID SERIAL PRIMARY KEY,
  first_name VARCHAR(30),
  last_name VARCHAR(30)
);
  
CREATE TABLE label(
  ID SERIAL PRIMARY KEY,
  name VARCHAR(30)
);


