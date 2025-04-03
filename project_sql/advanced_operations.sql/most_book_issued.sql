--Task 17: Find Employees with the Most Book Issues Processed
--Write a query to find the top 3 employees who have processed the most book issues. Display the employee name, number of books processed, and their branch.

SELECT issued_emp_id,
       emp_name,
       COUNT(issued_id) AS total_books_processed,
       branch.branch_id,
       branch_address
FROM issued_status
LEFT JOIN employees ON issued_status.issued_emp_id = employees.emp_id
LEFT JOIN branch ON employees.branch_id = branch.branch_id
WHERE issued_emp_id IS NOT NULL
GROUP BY issued_emp_id, emp_name, branch.branch_id, branch_address
ORDER BY total_books_processed DESC;