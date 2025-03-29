-- Task 10: List Employees with Their Branch Manager's Name and their branch details**:

SELECT *
FROM employees AS emp
INNER JOIN branch AS br ON emp.branch_id = br.branch_id
JOIN employees AS e ON br.manager_id = e.emp_id;


