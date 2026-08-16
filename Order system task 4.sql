CREATE DATABASE Ordersystem;
USE Ordersystem;
CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT NOT NULL,
    Order_Date DATE NOT NULL,
    Total_Amount DECIMAL(10 , 2 ) DEFAULT 0
);
CREATE TABLE Order_Details (
    Order_Detail_ID INT PRIMARY KEY,
    Order_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Quantity INT NOT NULL,
    Unit_Price DECIMAL(10,2) NOT NULL,
    Total_Price DECIMAL(10,2),

    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
);
INSERT INTO Orders (Order_ID, Customer_ID, Order_Date, Total_Amount)
VALUES
(101, 1, '2026-08-10', 0),
(102, 2, '2026-08-11', 0),
(103, 1, '2026-08-12', 0);
INSERT INTO Order_Details
(Order_Detail_ID, Order_ID, Product_ID, Quantity, Unit_Price, Total_Price)
VALUES
(1, 101, 201, 2, 500.00, 1000.00),
(2, 101, 202, 1, 750.00, 750.00),
(3, 102, 203, 3, 250.00, 750.00),
(4, 103, 201, 1, 500.00, 500.00);
UPDATE Orders
SET Total_Amount = (
    SELECT SUM(Total_Price)
    FROM Order_Details
    WHERE Order_Details.Order_ID = Orders.Order_ID
);
UPDATE Order_Details
SET Quantity = 3,
    Total_Price = Quantity * Unit_Price
WHERE Order_Detail_ID = 1;
UPDATE Orders
SET Total_Amount = (
    SELECT SUM(Total_Price)
    FROM Order_Details
    WHERE Order_Details.Order_ID = Orders.Order_ID
)
WHERE Order_ID = 101;
SELECT
    o.Customer_ID,
    o.Order_ID,
    o.Order_Date,
    od.Product_ID,
    od.Quantity,
    od.Unit_Price,
    od.Total_Price
FROM Orders o
JOIN Order_Details od
    ON o.Order_ID = od.Order_ID
WHERE o.Customer_ID = 1
ORDER BY o.Order_Date;
SELECT
    Customer_ID,
    COUNT(Order_ID) AS Total_Orders,
    SUM(Total_Amount) AS Total_Spent
FROM Orders
GROUP BY Customer_ID
ORDER BY Customer_ID;




