CREATE TABLE lesson2.users (
    user_id SERIAL PRIMARY KEY,
    email VARCHAR(100),
    username VARCHAR(50)
);

INSERT INTO lesson2.users (email, username) VALUES
('example@example.com', 'user01'),
('admin@gmail.com', 'admin01'),
('test@yahoo.com', 'tester02');

CREATE INDEX idx_users_email_hash
ON lesson2.users
USING HASH(email);

EXPLAIN
SELECT *
FROM lesson2.users
WHERE email = 'example@example.com';