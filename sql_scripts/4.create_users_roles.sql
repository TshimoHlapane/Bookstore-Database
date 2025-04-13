-- Create users with passwords
CREATE USER 'mel'@'localhost' IDENTIFIED BY '1234';
CREATE USER 'nhlawuleko'@'localhost' IDENTIFIED BY '1234';

-- Create Developer Role

CREATE ROLE IF NOT EXISTS 'dev';

-- Grant developer-level privileges on the bookstore database
GRANT SELECT, INSERT, UPDATE, DELETE ON bookstore_db.* TO 'dev';


-- Assign dev_role to Mel and Nhlawuleko


GRANT 'dev' TO 'mel'@'localhost';
GRANT 'dev' TO 'nhlawuleko'@'localhost';



