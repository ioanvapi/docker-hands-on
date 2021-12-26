\set mydb company
\set mytable employee

CREATE DATABASE :mydb;

GRANT ALL PRIVILEGES ON DATABASE :mydb TO postgres;

-- connect to new database
\connect :mydb

CREATE TABLE :mytable (
  id INT PRIMARY KEY,
  first_name VARCHAR,
  last_name VARCHAR
);

INSERT INTO :mytable(id, first_name, last_name)
VALUES (1, 'Bob', 'Smith');

INSERT INTO :mytable(id, first_name, last_name)
VALUES (2, 'John', 'Doe');

INSERT INTO :mytable(id, first_name, last_name)
VALUES (3, 'Jane', 'Fonda');



