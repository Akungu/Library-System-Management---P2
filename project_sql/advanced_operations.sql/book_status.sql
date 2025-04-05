--Task 14: Update Book Status on Return
--Write a query to update the status of books in the books table to "available" when they are returned (based on entries in the return_status table).

CREATE OR REPLACE PROCEDURE update_book_status(p_return_id VARCHAR(10), p_issued_id VARCHAR (10))
LANGUAGE plpgsql
AS $$
DECLARE
v_isbn VARCHAR(20);
v_book_name VARCHAR(20);

BEGIN
INSERT INTO return_status(return_id, issued_id, return_date)
VALUES (p_return_id,p_issued_id, CURRENT_DATE);

SELECT issued_book_isbn,
       issued_book_name
INTO v_isbn
     v_book_name
FROM issued_status
WHERE issued_id=p_issued_id;

UPDATE books
SET status = 'yes'
WHERE isbn =v_isbn;

RAISE NOTICE 'Book returned title: %', v_book_name;


END;
$$;

CALL update_book_status('RS119','IS136');

















SELECT *
FROM books
WHERE isbn='978-0-7432-7357-1';

SELECT issued_id
FROM issued_status
WHERE issued_book_isbn='978-0-7432-7357-1';

SELECT *
FROM return_status;