--CTA
-- Task 6: Create Summary Tables**: Use CTAS to generate new tables based on query results - each book and total book_issued_count

CREATE TABLE total_book_issued_count AS(
    SELECT issued_id,
           issued_book_name
    FROM issued_status
);

SELECT *
  FROM total_book_issued_count;