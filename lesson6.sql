CREATE TABLE lesson6.products (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    price NUMERIC(10,2),
    category_id INT
);

INSERT INTO lesson6.products (name, price, category_id) VALUES
('Laptop', 20000000, 1),
('Mouse', 500000, 1),
('Phone', 15000000, 2),
('Tablet', 8000000, 2);

CREATE OR REPLACE PROCEDURE lesson6.update_product_price(
    IN p_category_id INT,
    IN p_increase_percent NUMERIC
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_product RECORD;
    v_new_price NUMERIC(10,2);
BEGIN
    FOR v_product IN
        SELECT product_id, price
        FROM lesson6.products
        WHERE category_id = p_category_id
    LOOP
        v_new_price := v_product.price + (v_product.price * p_increase_percent / 100);

        UPDATE lesson6.products
        SET price = v_new_price
        WHERE product_id = v_product.product_id;
    END LOOP;
END;
$$;

CALL lesson6.update_product_price(1, 10);

SELECT *
FROM lesson6.products
WHERE category_id = 1;