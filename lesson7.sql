CREATE TABLE lesson7.customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE lesson7.orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    amount NUMERIC(10,2),
    order_date DATE DEFAULT CURRENT_DATE
);

INSERT INTO lesson7.customers (name, email) VALUES
('Nguyen Van A', 'a@gmail.com'),
('Tran Thi B', 'b@gmail.com');

CREATE OR REPLACE PROCEDURE lesson7.add_order(
    IN p_customer_id INT,
    IN p_amount NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN
    IF NOT EXISTS (
        SELECT 1
        FROM lesson7.customers
        WHERE customer_id = p_customer_id
    ) THEN
        RAISE EXCEPTION 'Customer not found';
    END IF;

    INSERT INTO lesson7.orders (customer_id, amount)
    VALUES (p_customer_id, p_amount);
END;
$$;

CALL lesson7.add_order(1, 2500);

SELECT *
FROM lesson7.orders;