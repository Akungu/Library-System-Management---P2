--CTA
-- Task 6: Create Summary Tables**: Use CTAS to generate new tables based on query results - each book and total book_issued_count


CREATE TABLE issued_books_count AS(
    SELECT books.isbn,
       books.book_title,
       COUNT(issued_status.issued_id) AS issue_count
FROM books
LEFT JOIN issued_status ON books.isbn = issued_status.issued_book_isbn
GROUP BY books.isbn, books.book_title
ORDER BY issue_count DESC
);
