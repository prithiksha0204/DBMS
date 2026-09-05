CREATE DATABASE PaymentDB;
USE PaymentDB;

CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_id INT NOT NULL,
    amount DECIMAL(10,2) NOT NULL,
    payment_mode VARCHAR(30) NOT NULL,
    payment_date DATE NOT NULL,
    payment_status VARCHAR(20) NOT NULL
);

INSERT INTO Payment
(payment_id, customer_id, order_id, amount, payment_mode, payment_date, payment_status)
VALUES
(101, 1, 5001, 1500.00, 'UPI', '2026-08-01', 'SUCCESS'),
(102, 2, 5002, 2500.00, 'CARD', '2026-08-02', 'SUCCESS'),
(103, 3, 5003, 1200.00, 'NET BANKING', '2026-08-03', 'FAILED'),
(104, 4, 5004, 3500.00, 'UPI', '2026-08-04', 'SUCCESS'),
(105, 5, 5005, 1800.00, 'CARD', '2026-08-05', 'PENDING'),
(106, 6, 5006, 2200.00, 'CASH', '2026-08-06', 'SUCCESS');
SELECT * FROM Payment
WHERE payment_status = 'SUCCESS';
SELECT * FROM Payment
WHERE payment_status = 'FAILED';
SELECT * FROM Payment
WHERE payment_status = 'PENDING';
UPDATE Payment
SET payment_status = 'SUCCESS'
WHERE payment_id = 103;
SELECT payment_mode, COUNT(*) AS total_transactions
FROM Payment
GROUP BY payment_mode;
SELECT payment_mode, SUM(amount) AS total_amount
FROM Payment
WHERE payment_status = 'SUCCESS'
GROUP BY payment_mode;
SELECT payment_status, COUNT(*) AS total_transactions
SELECT payment_id, customer_id, order_id, amount,
       payment_mode, payment_date, payment_status
FROM Payment
ORDER BY payment_date;
SELECT SUM(amount) AS successful_payment_amount
FROM Payment
WHERE payment_status = 'SUCCESS';
SELECT payment_id, customer_id, amount, payment_mode, payment_date
FROM Payment
WHERE payment_status = 'FAILED'
ORDER BY payment_date;
