-- Task 12: Retrieve the List of Books Not Yet Returned

SELECT *
FROM issued_status
LEFT JOIN return_status ON issued_status.issued_id = return_status.issued_id
WHERE return_id IS NULL;


