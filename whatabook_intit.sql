/*
	whatabook.init.sql
    Gris Duran
    August 8 2022
    WhatAbood database initialization script.alter
*/

-- drop test user if exists
DROP USER IF EXISTS 'whatabook_user'@'localhost';

-- create whatabook_user and grant them all privileges to the whatabook database
CREATE USER 'whatabook_user'@'localhost' IDENTIFIED WITH mysql_native_password BY 'MySQL8IsGreat!';

-- grant all privileges to the whatabook database to user whatabook_user on localhost
GRANT ALL PRIVILEGES ON whatabook. * TO'whatabook_user'@'localhost';

-- drop constraints if they exist
ALTER TABLE wishlist DROP FOREIGN KEY fk_book;
ALTER TABLE wishlist DROP FOREIGN KEY fk_user;

-- drop tables if they exist
DROP TABLE IF EXISTS store;
DROP TABLE IF EXISTS book;
DROP TABLE IF EXISTS wishlist;
DROP TABLE IF EXISTS user;

/*
	Create table(s)
*/
CREATE TABLE store (
	store_id	INT 			NOT NULL 	AUTO_INCREMENT,
    locate		VARCHAR(500) 	NOT NULL,
    PRIMARY KEY(store_id)
    );
    
CREATE TABLE book (
	book_id 	INT 			NOT NULL 	AUTO_INCREMENT,
    book_name	VARCHAR(200)	NOT NULL,
    author		VARCHAR(200)	NOT NULL,
    details		VARCHAR(500),
    PRIMARY KEY(book_id)
    );
    
CREATE TABLE user (
	user_id			INT 			NOT NULL 	AUTO_INCREMENT,
	first_name		VARCHAR(75)		NOT NULL,
	last_name		VARCHAR(75)		NOT NULL,
	PRIMARY KEY(user_id)
);

CREATE TABLE wishlist (
	wishlist_id		INT 			NOT NULL 	AUTO_INCREMENT,
	user_id			INT 			NOT NULL,
	book_id 		INT 			NOT NULL,
	PRIMARY KEY (wishlist_id),
    CONSTRAINT fk_book
    FOREIGN KEY (book_id)
		REFERENCES book(book_id)
);

/*
	insert store records
*/
INSERT INTO store(locate)
	VALUES('1000 Galvin Rd S, Bellevue, NE 68005');

/*
	insert book records
*/
INSERT INTO book(book_name, author, details)
	VALUES('Ed ed and eddie', 'M.R.Ramos', "The third part of school");

INSERT INTO book(book_name, author, details)
	VALUES('Matilda', 'M.R,Ramos', "The third part of school");

INSERT INTO book(book_name, author, details)
    VALUES('The Cat In The Hat', 'J.R.Luis', "The second part of the Castle");
    
 INSERT INTO book(book_name, author, details)
    VALUES('The Two Towers', 'J.R.Tolkien', "The second part of The Lord of The Rings");
    
INSERT INTO book(book_name, author, details)
    VALUES('The Hat', 'J.R.Tom', "The first part of the line");
    
INSERT INTO book(book_name, author, details)
    VALUES('Turtles', 'J.L.Matt', "The fight");
    
INSERT INTO book(book_name, author, details)
    VALUES('Water', 'R.J.Rose', "The second part");
    
INSERT INTO book(book_name, author, details)
    VALUES('Help', 'Y.N.Young', "first Help");
    
INSERT INTO book(book_name, author, details)
    VALUES('Let Me Go', 'Y.N.Young', "I Will Not Let You Go");
    
INSERT INTO book(book_name, author, details)
    VALUES('Mora', 'Y.N.Young', "Do not Let Mora Out");
    
INSERT INTO book(book_name, author, details)
    VALUES('Silence', 'T.B.Jenkins', "Stay In Your Place");
    
INSERT INTO book(book_name, author, details)
    VALUES('GOAT', 'W.Keontre', "Lets Go");

/*
	insert user
*/
INSERT INTO user(first_name, last_name)
	VALUES('Mark', 'Smith');

INSERT INTO user(first_name, last_name)
	VALUES('Rose', 'Dalton');

INSERT INTO user(first_name, last_name)
	VALUES('Ricardo', 'Stamp');
    
/*
	insert wishlist records
*/
INSERT INTO wishlist(user_id, book_id)
	VALUES (
		(SELECT user_id FROM user WHERE first_name = 'Mark'),
        (SELECT book_id FROM book WHERE book_name = 'GOAT or Mora')
	);
    
INSERT INTO wishlist(user_id,book_id)
	VALUES (
		(SELECT user_id FROM user WHERE first_name = 'Rose'),
        (SELECT book_id FROM book WHERE book_name = 'Help')
	);
    
INSERT INTO wishlist(user_id, book_id)
	VALUES (
		(SELECT user_id FROM user WHERE first_name ='Ricardo'),
        (SELECT book_id FROM book WHERE book_name = 'Ed Ed and Eddie')
	);
    
