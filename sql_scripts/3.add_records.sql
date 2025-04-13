-- 1. book_language
INSERT INTO book_language (language_id, language_name) VALUES
(1, 'English'),
(2, 'Spanish'),
(3, 'French');

-- 2. publisher
INSERT INTO publisher (publisher_id, publisher_name) VALUES
(1, 'Penguin Random House'),
(2, 'HarperCollins'),
(3, 'Macmillan');

-- 3. author
INSERT INTO author (author_id, first_name, last_name) VALUES
(1, 'George', 'Orwell'),
(2, 'Jane', 'Austen'),
(3, 'Gabriel', 'García Márquez');

ALTER TABLE book
MODIFY publication_year INT;

-- 4. book
INSERT INTO book (book_id, title, isbn, publication_year, language_id, publisher_id, price) VALUES
(1, '1984', '9780451524935', 1949, 1, 1, 15.00),
(2, 'Pride and Prejudice', '9780141040349', 1813, 1, 1, 12.50),
(3, 'One Hundred Years of Solitude', '9780060883287', 1967, 2, 2, 18.75);

-- 5. book_author
INSERT INTO book_author (book_id, author_id) VALUES
(1, 1),
(2, 2),
(3, 3);

-- 6. country
INSERT INTO country (country_id, country_name) VALUES
(1, 'United States'),
(2, 'United Kingdom'),
(3, 'Spain');

-- 7. address
INSERT INTO address (address_id, address_line, city, postal_code, country_id) VALUES
(1, '123 Main St', 'New York', '10001', 1),
(2, '456 Queen St', 'London', 'SW1A 1AA', 2),
(3, 'Calle Falsa 123', 'Madrid', '28013', 3);

-- 8. address_status
INSERT INTO address_status (address_status_id, status_name) VALUES
(1, 'Current'),
(2, 'Old');

-- 9. customer
INSERT INTO customer (customer_id, first_name, last_name, email) VALUES
(1, 'Alice', 'Johnson', 'alice@example.com'),
(2, 'Bob', 'Smith', 'bob@example.com');

-- 10. customer_address
INSERT INTO customer_address (customer_id, address_id, address_status_id) VALUES
(1, 1, 1),
(2, 2, 1),
(2, 3, 2);

-- 11. order_status
INSERT INTO order_status (order_status_id, status_name) VALUES
(1, 'Pending'),
(2, 'Shipped'),
(3, 'Delivered');

-- 12. shipping_method
INSERT INTO shipping_method (shipping_method_id, method_name) VALUES
(1, 'Standard'),
(2, 'Express');

-- 13. cust_order
INSERT INTO cust_order (order_id, customer_id, order_date, order_status_id, shipping_method_id) VALUES
(1, 1, '2025-04-01 10:00:00', 1, 1),
(2, 2, '2025-04-05 15:30:00', 2, 2);

-- 14. order_line
INSERT INTO order_line (order_id, book_id, quantity) VALUES
(1, 1, 2),
(2, 3, 1),
(2, 2, 1);

-- 15. order_history
INSERT INTO order_history (order_history_id, order_id, order_status_id, status_date) VALUES
(1, 1, 1, '2025-04-01 10:00:00'),
(2, 2, 1, '2025-04-05 15:30:00'),
(3, 2, 2, '2025-04-06 09:00:00');
