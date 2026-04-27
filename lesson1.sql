CREATE TABLE lesson1.orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount NUMERIC(12,2)
);

INSERT INTO lesson1.orders (customer_id, order_date, total_amount) VALUES
(101, '2026-04-01', 1500000),
(102, '2026-04-02', 2300000),
(101, '2026-04-03', 1750000),
(103, '2026-04-04', 3200000),
(104, '2026-04-05', 2800000),
(101, '2026-04-06', 1950000);

EXPLAIN ANALYZE
SELECT *
FROM lesson1.orders
WHERE customer_id = 101;

CREATE INDEX idx_orders_customer_id
ON lesson1.orders(customer_id);

EXPLAIN ANALYZE
SELECT *
FROM lesson1.orders
WHERE customer_id = 101;