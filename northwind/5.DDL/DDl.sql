-- Data Definition Language

-- CREATE TABLE table_name (...columns) VALUES (...values_column)

-- ALTER TABLE table_name
-- ALTER TABLE table_name ADD COLUMN column_name data_typ
-- ALTER TABLE table_name RENAME TO new_table_name
-- ALTER TABLE table_name RENAME old_name_column TO new_column_name
-- ALTER TABLE table_name DROP COLUMN column_name
-- ALTER TABLE table_name ALTER_COLUMN column_name SET DATA TYPE

-- DROP TABLE table_name

-- TRUNCATE TABLE table_name

CREATE SEQUENCE seq1;

SELECT nextval('seq1');

SELECT currval('seq1');

SELECT lastval();

SELECT setval('seq1', 2);

CREATE SEQUENCE IF NOT EXISTS seq2 INCREMENT 3 MINVALUE 0 MAXVALUE 128 START
WITH
    0