	select query to view users wishlist items
*/
SELECT user.user_id, user.first_name, user.last_name, book.book_id, book.book_name, book.author
FROM wishlist
	INNER JOIN user ON wishlist.user_id = user.user_id
    INNER JOIN book ON wishlist.book_id = book.book_id
WHERE user.user_id = 1;

/*
	Select query to view the store's location
*/
SELECT store_id, locate from store;

/*
	Select query to view a full listing of the books WhatAbook offers
*/
SELECT book_id, book_name, author, details from book;

SELECT book_id, book_name, author, details
FROM book
WHERE book_id NOT IN (SELECT book_id FROM wishlist WHERE user_id = 1);

INSERT INTO wishlist(user_id, book_id)
	VALUES(1, 9)
