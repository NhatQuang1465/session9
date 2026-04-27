CREATE TABLE lesson4.sales (
    sale_id SERIAL PRIMARY KEY,
    customer_id INT,
    product_id INT,
    sale_date DATE,
    amount NUMERIC(10,2)
);

INSERT INTO lesson4.sales (customer_id, product_id, sale_date, amount) VALUES
(1, 101, '2026-04-01', 500),
(1, 102, '2026-04-02', 700),
(2, 103, '2026-04-03', 300),
(2, 104, '2026-04-04', 900),
(3, 105, '2026-04-05', 1500);

CREATE VIEW lesson4.customersales AS
SELECT
    customer_id,
    SUM(amount) AS total_amount
FROM lesson4.sales
GROUP BY customer_id;

SELECT *
FROM lesson4.customersales
WHERE total_amount > 1000;

UPDATE lesson4.customersales
SET total_amount = 2000
WHERE customer_id = 1;