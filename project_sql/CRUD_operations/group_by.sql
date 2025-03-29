-- Task 5: List Members Who Have Issued More Than One Book
-- Objective: Use GROUP BY to find members who have issued more than one book.

SELECT issued_emp_id,
       COUNT(issued_id) AS total_book_count
FROM issued_status
GROUP BY issued_emp_id
HAVING COUNT(issued_id)> 1
ORDER BY total_book_count DESC;