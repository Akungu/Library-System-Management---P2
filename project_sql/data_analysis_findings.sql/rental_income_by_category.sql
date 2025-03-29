-- Task 8: Find Total Rental Income by Category:

    SELECT category,
          SUM(rental_price)
FROM books
LEFT JOIN issued_status ON books.isbn = issued_status.issued_book_isbn
GROUP BY category;

