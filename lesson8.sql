CREATE TABLE lesson8.customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    total_spent NUMERIC(12,2) DEFAULT 0
);

CREATE TABLE lesson8.orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    total_amount NUMERIC(12,2)
);

INSERT INTO lesson8.customers (name) VALUES
('Nguyen Van A'),
('Tran Thi B');

CREATE OR REPLACE PROCEDURE lesson8.add_order_and_update_customer(
    IN p_customer_id INT,
    IN p_amount NUMERIC
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_exists INT;
BEGIN
    SELECT COUNT(*)
    INTO v_exists
    FROM lesson8.customers
    WHERE customer_id = p_customer_id;

    IF v_exists = 0 THEN
        RAISE EXCEPTION 'Customer not found';
    END IF;

    BEGIN
        INSERT INTO lesson8.orders (customer_id, total_amount)
        VALUES (p_customer_id, p_amount);

        UPDATE lesson8.customers
        SET total_spent = total_spent + p_amount
        WHERE customer_id = p_customer_id;

    EXCEPTION
        WHEN OTHERS THEN
            RAISE EXCEPTION 'Failed to add order';
    END;
END;
$$;

CALL lesson8.add_order_and_update_customer(1, 3500);

SELECT * FROM lesson8.customers;
SELECT * FROM lesson8.orders;