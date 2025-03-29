-- Task 9. **List Members Who Registered in 2021**:

SELECT *
FROM members
WHERE EXTRACT(YEAR FROM reg_date) = 2021;