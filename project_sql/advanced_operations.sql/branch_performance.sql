-- Task 15: Branch Performance Report
--Create a query that generates a performance report for each branch, showing the number of books issued, the number of books returned, and the total revenue generated from book rentals.

SELECT branch.branch_id,
       COUNT(is1.issued_id) AS total_books_issued,
        COUNT(return_id) AS returned_books,
       SUM(books.rental_price) AS total_rental_income
FROM branch
LEFT JOIN employees ON branch.branch_id = employees.branch_id
LEFT JOIN issued_status ON employees.emp_id = issued_status.issued_emp_id 
LEFT JOIN books ON books.isbn = issued_status.issued_book_isbn
LEFT JOIN issued_status AS is1 ON books.isbn = is1.issued_book_isbn
LEFT JOIN return_status ON is1.issued_id = return_status.issued_id
GROUP BY branch.branch_id
ORDER BY branch_id ASC;