-- Task 4: Retrieve All Books Issued by a Specific Employee
-- Objective: Select all books issued by the employee with emp_id = 'E101'.

SELECT issued_book_name
FROM issued_status
WHERE issued_emp_id = 'E101';