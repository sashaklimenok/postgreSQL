CREATE TABLE publisher (
    publisher_id SERIAL NOT NULL,
    org_name CHARACTER varying(32) NOT NULL,
    address TEXT NOT NULL,
    CONSTRAINT pk_publisher_id PRIMARY KEY (publisher_id)
);

CREATE TABLE book (
    book_id SERIAL NOT NULL,
    title TEXT NOT NULL,
    isbn CHARACTER varying(32) NOT NULL,
    fk_publisher_id SERIAL NOT NULL,
    CONSTRAINT pk_book_id PRIMARY KEY (book_id) CONSTRAINT fk_publisher_id FOREIGN KEY (fk_publisher_id) REFERENCES publisher (publisher_id) ON DELETE CASCADE -- If publisher deleted, delete their books too
    ON UPDATE CASCADE, -- If publisher_id changes, update books too
);

ALTER TABLE book
ADD CONSTRAINT fk_book_publisher FOREIGN KEY (fk_publisher_id) REFERENCES publisher (publisher_id)

INSERT INTO
    book
VALUES (1, 'Book 1', '12345678', 2),
    (2, 'Book 2', '87654321', 2),
    (3, 'Book 3', '98765432', 1);

INSERT INTO
    publisher
VALUES (1, 'Publisher 1', 'BY'),
    (2, 'Publisher 2', 'BY');

SELECT * FROM book;

SELECT * FROM publisher;

DROP TABLE publisher;

DROP TABLE book;

CREATE DATABASE northwind