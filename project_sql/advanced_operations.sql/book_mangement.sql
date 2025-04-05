--Task 19: Stored Procedure
--Objective: Create a stored procedure to manage the status of books in a library system.
   -- Description: Write a stored procedure that updates the status of a book based on its issuance or return. Specifically:
    --If a book is issued, the status should change to 'no'.
    --If a book is returned, the status should change to 'yes'.

CREATE OR REPLACE PROCEDURE manage_book_status(p_issued_id VARCHAR(10), p_issued_member_id VARCHAR(10), p_issued_book_isbn VARCHAR(20), p_issued_emp_id VARCHAR(10))
LANGUAGE plpgsql
AS $$
DECLARE
v_status VARCHAR(10);
BEGIN

SELECT status
INTO 
v_status
FROM books
WHERE isbn = p_issued_book_isbn;


IF v_status = 'yes' THEN
 INSERT INTO issued_status(issued_id, issued_member_id, issued_date, issued_book_isbn, issued_emp_id)
 VALUES(p_issued_id, p_issued_member_id, CURRENT_DATE, p_issued_book_isbn, p_issued_emp_id);

 UPDATE books
 SET status='no'
 WHERE isbn = p_issued_book_isbn;

 RAISE NOTICE 'Successfully uploaded book: %', p_issued_book_isbn;

ELSE
 RAISE NOTICE 'Sorry, book unavailable book isbn: %', p_issued_book_isbn;

 END IF;

END;
$$;

CALL manage_book_status('IS142', 'C110', '978-0-307-58837-1', 'E104');