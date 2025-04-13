-- 1. View all books with their authors and publishers
SELECT 
    b.title,
    CONCAT(a.first_name, ' ', a.last_name) AS author_name,
    p.publisher_name
FROM book b
JOIN book_author ba ON b.book_id = ba.book_id
JOIN author a ON ba.author_id = a.author_id
LEFT JOIN publisher p ON b.publisher_id = p.publisher_id;

-- 2. List all customer orders with their status and shipping method
SELECT 
    o.order_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    o.order_date,
    os.status_name AS order_status,
    sm.method_name AS shipping_method
FROM cust_order o
JOIN customer c ON o.customer_id = c.customer_id
JOIN order_status os ON o.order_status_id = os.order_status_id
JOIN shipping_method sm ON o.shipping_method_id = sm.shipping_method_id;

-- 3. List all books with their total sales quantity
SELECT 
    b.title,
    SUM(ol.quantity) AS total_sold
FROM order_line ol
JOIN book b ON ol.book_id = b.book_id
GROUP BY b.title
ORDER BY total_sold DESC;

-- 4. List all customers with their addresses and address status
SELECT 
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    a.address_line,
    a.city,
    co.country_name,
    ast.status_name AS address_status
FROM customer c
JOIN customer_address ca ON c.customer_id = ca.customer_id
JOIN address a ON ca.address_id = a.address_id
JOIN country co ON a.country_id = co.country_id
JOIN address_status ast ON ca.address_status_id = ast.address_status_id;

-- 5. List all order statuses with their total orders
SELECT 
    os.status_name,
    COUNT(o.order_id) AS total_orders
FROM cust_order o
JOIN order_status os ON o.order_status_id = os.order_status_id
GROUP BY os.status_name;

