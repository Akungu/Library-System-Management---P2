--Task 16: CTAS: Create a Table of Active Members
--Use the CREATE TABLE AS (CTAS) statement to create a new table active_members containing members who have issued at least one book in the last 1 year.

CREATE TABLE active_members AS(
    SELECT issued_status.issued_id,
       issued_status.issued_member_id,
       issued_status.issued_book_name,
       issued_status.issued_date,
       members.member_name
FROM issued_status
LEFT JOIN members ON issued_status.issued_member_id = members.member_id
WHERE issued_date > CURRENT_DATE - INTERVAL '1 year'
);