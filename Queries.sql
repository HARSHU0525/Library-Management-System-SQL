-- Display all books with author details
SELECT 
    b.title,
    a.author_name,
    b.category,
    b.available_copies
FROM Books b
JOIN Authors a
ON b.author_id = a.author_id;


-- Display books currently borrowed
SELECT 
    m.name,
    b.title,
    br.issue_date
FROM BorrowRecords br
JOIN Members m 
ON br.member_id = m.member_id
JOIN Books b 
ON br.book_id = b.book_id
WHERE br.return_date IS NULL;


-- Count books in each category
SELECT 
    category,
    COUNT(*) AS total_books
FROM Books
GROUP BY category;


-- Most borrowed books
SELECT 
    b.title,
    COUNT(br.book_id) AS borrow_count
FROM Books b
JOIN BorrowRecords br
ON b.book_id = br.book_id
GROUP BY b.title
ORDER BY borrow_count DESC;


-- Update available copies after borrowing
UPDATE Books
SET available_copies = available_copies - 1
WHERE book_id = 2;


-- Add a new member
INSERT INTO Members (name, email, join_date)
VALUES ('Priya Singh', 'priya@gmail.com', CURRENT_DATE);


-- Delete a member
DELETE FROM Members
WHERE member_id = 3;


-- View available books
CREATE VIEW AvailableBooks AS
SELECT 
    title,
    available_copies
FROM Books
WHERE available_copies > 0;


-- Display available books
SELECT * FROM AvailableBooks;