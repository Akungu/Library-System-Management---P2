--Task 13: Identify Members with Overdue Books
--Write a query to identify members who have overdue books (assume a 360-day return period). Display the member's name, book title, issue date, and days overdue.



SELECT member_name,
       book_title,
       issued_date,
       CURRENT_DATE - issued_date AS days_overdue
FROM issued_status
LEFT JOIN return_status ON issued_status.issued_id = return_status.issued_id
LEFT JOIN books ON issued_status.issued_book_isbn = books.isbn
LEFT JOIN members ON issued_status.issued_member_id = members.member_id
WHERE return_id IS NULL
AND (CURRENT_DATE - issued_date) > 360;

