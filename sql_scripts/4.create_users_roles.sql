-- Create Developer Role

CREATE ROLE IF NOT EXISTS 'dev_role';

-- Grant developer-level privileges on the bookstore database
GRANT SELECT, INSERT, UPDATE, DELETE ON bookstore_db.* TO 'dev_role';


-- Assign dev_role to Mel and Nhlawuleko


GRANT 'dev_role' TO 'mel'@'localhost';
GRANT 'dev_role' TO 'nhlawuleko'@'localhost';


-- Set dev_role as default for both users


SET DEFAULT ROLE 'dev_role' TO 'mel'@'localhost';
SET DEFAULT ROLE 'dev_role' TO 'nhlawuleko'@'localhost';


