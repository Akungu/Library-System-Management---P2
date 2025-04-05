--Task 19: Create Table As Select (CTAS)
--Objective: Create a CTAS (Create Table As Select) query to identify overdue books and calculate fines.

--Description: Write a CTAS query to create a new table that lists each member and the books they have issued but not returned within 360 days. The table should include:
   -- The number of overdue books.
   -- The total fines, with each day's fine calculated at $0.50.
    --The number of books issued by each member.
    --The resulting table should show:
   -- Member ID
    --Number of overdue books
    --Total fines

   CREATE TABLE fines_summary AS(
     SELECT member_id,
       SUM((CURRENT_DATE - issued_date))AS days_overdue,
      SUM((CURRENT_DATE - issued_date)*0.50) AS total_fine
FROM issued_status
LEFT JOIN return_status ON issued_status.issued_id = return_status.issued_id
LEFT JOIN books ON issued_status.issued_book_isbn = books.isbn
LEFT JOIN members ON issued_status.issued_member_id = members.member_id
WHERE return_id IS NULL
AND (CURRENT_DATE - issued_date) > 360
GROUP BY member_id
   );
