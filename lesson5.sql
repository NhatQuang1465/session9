CREATE TABLE lesson5.sales (
    sale_id SERIAL PRIMARY KEY,
    customer_id INT,
    amount NUMERIC(10,2),
    sale_date DATE
);

INSERT INTO lesson5.sales (customer_id, amount, sale_date) VALUES
(1, 500, '2026-04-01'),
(2, 700, '2026-04-03'),
(1, 1200, '2026-04-05'),
(3, 900, '2026-04-07'),
(2, 1500, '2026-04-10');

CREATE OR REPLACE PROCEDURE lesson5.calculate_total_sales(
    IN start_date DATE,
    IN end_date DATE,
    OUT total NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN
    SELECT COALESCE(SUM(amount), 0)
    INTO total
    FROM lesson5.sales
    WHERE sale_date BETWEEN start_date AND end_date;
END;
$$;

CALL lesson5.calculate_total_sales('2026-04-01', '2026-04-07', NULL);