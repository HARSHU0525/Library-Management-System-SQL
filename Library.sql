CREATE DATABASE LibraryDB;
USE LibraryDB;

-- Authors Table
CREATE TABLE Authors (
    author_id INT PRIMARY KEY AUTO_INCREMENT,
    author_name VARCHAR(100) NOT NULL
);

-- Books Table
CREATE TABLE Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(150) NOT NULL,
    author_id INT,
    category VARCHAR(50),
    total_copies INT,
    available_copies INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id)
);

-- Members Table
CREATE TABLE Members (
    member_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    join_date DATE
);

-- Borrow Records Table
CREATE TABLE BorrowRecords (
    borrow_id INT PRIMARY KEY AUTO_INCREMENT,
    member_id INT,
    book_id INT,
    issue_date DATE,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id)
);

-- Insert Authors
INSERT INTO Authors (author_name) VALUES
('J.K. Rowling'),
('George Orwell'),
('James Clear');

-- Insert Books
INSERT INTO Books 
(title, author_id, category, total_copies, available_copies)
VALUES
('Harry Potter', 1, 'Fantasy', 10, 8),
('1984', 2, 'Fiction', 5, 2),
('Atomic Habits', 3, 'Self Help', 7, 4);

-- Insert Members
INSERT INTO Members (name, email, join_date) VALUES
('Rahul Sharma', 'rahul@gmail.com', '2025-01-10'),
('Anjali Gupta', 'anjali@gmail.com', '2025-02-15'),
('Arjun Patel', 'arjun@gmail.com', '2025-03-20');

-- Insert Borrow Records
INSERT INTO BorrowRecords 
(member_id, book_id, issue_date, return_date)
VALUES
(1, 1, '2025-05-01', '2025-05-10'),
(2, 2, '2025-05-05', NULL),
(3, 3, '2025-05-07', NULL);