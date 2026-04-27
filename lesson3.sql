CREATE TABLE lesson3.products (
    product_id SERIAL PRIMARY KEY,
    category_id INT,
    price NUMERIC(10,2),
    stock_quantity INT
);

INSERT INTO lesson3.products (category_id, price, stock_quantity) VALUES
(1, 150000, 20),
(1, 250000, 15),
(2, 300000, 10),
(2, 180000, 8),
(3, 500000, 5);

CLUSTER lesson3.products USING products_pkey;

CREATE INDEX idx_products_price
ON lesson3.products(price);

EXPLAIN ANALYZE
SELECT *
FROM lesson3.products
WHERE category_id = 1
ORDER BY price;