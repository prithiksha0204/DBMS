CREATE DATABASE ProductManagementSystem;
USE ProductManagementSystem;
CREATE TABLE Category(
	CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50)
);
CREATE TABLE Product(
	ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    CategoryID INT,
    Price DECIMAL(10,2),
    Stock INT,
    FOREIGN KEY(CategoryID) REFERENCES Category(CategoryID)
);
INSERT INTO Category VALUES
(101, 'Electronics'),(102,'Clothing'),(103,'Books'),
(104,'Furnitures'),(105,'Sports');
INSERT INTO  Product VALUES
(1,'Laptop',101,65000,15),
(2,'Mobile',101,25000,40),
(3,'T-Shirt',102,800,60),
(4,'Novel',103,450,100),
(5,'Study Table',104,8500,20),
(6,'Cricket Bat',105,2200,35);
SELECT * FROM Product;
UPDATE Product SET Price=27000 WHERE ProductID=2;
DELETE FROM Product WHERE ProductID=4;
SELECT C.CategoryName,COUNT(P.ProductID) AS NumberOfProducts
FROM Category C LEFT JOIN Product P
ON C.CategoryID=P.CategoryID
GROUP BY C.CategoryName;