-- 1. Author table
CREATE TABLE author (
    author_id INT PRIMARY KEY,
    name VARCHAR(255),
    bio TEXT
);

-- 2. Publisher table
CREATE TABLE publisher (
    publisher_id INT PRIMARY KEY,
    name VARCHAR(255),
    address TEXT
);

-- 3. Book table
CREATE TABLE book (
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    publisher_id INT,
    language_id INT,
    FOREIGN KEY (publisher_id) REFERENCES publisher(publisher_id),
    FOREIGN KEY (language_id) REFERENCES book_language(language_id)
);

-- 4. Book Language table
CREATE TABLE book_language (
    language_id INT PRIMARY KEY,
    language_code VARCHAR(10),
    language_name VARCHAR(100)
);

-- 5. Book_Author junction table (Many-to-Many)
CREATE TABLE book_author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id),
    FOREIGN KEY (author_id) REFERENCES author(author_id)
);

-- 6. Customer table
CREATE TABLE customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(255),
    email VARCHAR(255)
);

-- 7. Address table
CREATE TABLE address (
    address_id INT PRIMARY KEY,
    street VARCHAR(255),
    city VARCHAR(100),
    postal_code VARCHAR(20),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES country(country_id)
);

-- 8. Country table
CREATE TABLE country (
    country_id INT PRIMARY KEY,
    country_name VARCHAR(100),
    country_code VARCHAR(10)
);

-- 9. Address Status table
CREATE TABLE address_status (
    status_id INT PRIMARY KEY,
    status_description VARCHAR(100)
);

-- 10. Customer Address table
CREATE TABLE customer_address (
    customer_id INT,
    address_id INT,
    status_id INT,
    PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES address(address_id),
    FOREIGN KEY (status_id) REFERENCES address_status(status_id)
);

-- 11. Shipping Method table
CREATE TABLE shipping_method (
    method_id INT PRIMARY KEY,
    method_name VARCHAR(100),
    cost DECIMAL(10,2)
);

-- 12. Order Status table
CREATE TABLE order_status (
    status_id INT PRIMARY KEY,
    status_description VARCHAR(100)
);

-- 13. Cust_Order table (main order table)
CREATE TABLE cust_order (
    order_id INT PRIMARY KEY,
    customer_id INT,
    status_id INT,
    shipping_method_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (status_id) REFERENCES order_status(status_id),
    FOREIGN KEY (shipping_method_id) REFERENCES shipping_method(method_id)
);

-- 14. Order Line table (Items in order)
CREATE TABLE order_line (
    line_id INT PRIMARY KEY,
    order_id INT,
    book_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (book_id) REFERENCES book(book_id)
);

-- 15. Order History table
CREATE TABLE order_history (
    history_id INT PRIMARY KEY,
    order_id INT,
    status_id INT,
    changed_at TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES cust_order(order_id),
    FOREIGN KEY (status_id) REFERENCES order_status(status_id)
);