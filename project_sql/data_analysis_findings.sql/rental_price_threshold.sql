-- Task 11. Create a Table of Books with Rental Price Above a Certain Threshold

CREATE TABLE  pricy_books AS(
    SELECT *
FROM books
WHERE rental_price > 5
);