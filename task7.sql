CREATE DATABASE Ecommerce;
USE Ecommerce;
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    Email VARCHAR(100),
    City VARCHAR(50)
);

CREATE TABLE Product (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Category VARCHAR(50),
    Price DECIMAL(10,2),
    Stock INT
);
INSERT INTO Customer VALUES
(1, 'Ravi', 'ravi@gmail.com', 'Chennai'),
(2, 'Arun', 'arun@gmail.com', 'Coimbatore'),
(3, 'Priya', 'priya@gmail.com', 'Madurai'),
(4, 'Kavi', 'kavi@gmail.com', 'Chennai');

INSERT INTO Product VALUES
(101, 'Laptop', 'Electronics', 55000, 10),
(102, 'Mouse', 'Electronics', 800, 50),
(103, 'Keyboard', 'Electronics', 1500, 30),
(104, 'T-Shirt', 'Clothing', 700, 25),
(105, 'Shoes', 'Footwear', 2500, 0);
SELECT * FROM Product;
SELECT ProductName, Price
FROM Product;
SELECT *
FROM Product
WHERE Price > 2000;
SELECT *
FROM Product
WHERE Category = 'Electronics';
SELECT *
FROM Product
ORDER BY Price ASC;
SELECT *
FROM Product
ORDER BY Price DESC;
SELECT DISTINCT Category
FROM Product;
SELECT *FROM Product WHERE Price BETWEEN 500 AND 3000;
SELECT *
FROM Product
WHERE Stock > 0;
SELECT *
FROM Product
WHERE Stock = 0;
SELECT *
FROM Customer;
SELECT *
FROM Customer
WHERE City = 'Chennai';
SELECT * FROM Product WHERE Category = 'Electronics' AND Price > 1000;
SELECT *
FROM Product
WHERE Category = 'Clothing'
OR Category = 'Footwear';
SELECT COUNT(*) AS TotalProducts
FROM Product;
SELECT AVG(Price) AS AveragePrice
FROM Product;
SELECT MAX(Price) AS HighestPrice
FROM Product;
SELECT MIN(Price) AS LowestPrice
FROM Product;
SELECT Category, COUNT(*) AS ProductCount
FROM Product
GROUP BY Category;
SELECT SUM(Stock) AS TotalStock
FROM Product;
SELECT ProductName, Category, Price, Stock
FROM Product
ORDER BY Price DESC;

