-- Task 2: Update an Existing Member's Address

UPDATE members
SET member_address='135 Pine St'
WHERE member_id='C118';

SELECT *
FROM members;