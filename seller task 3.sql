CREATE DATABASE SellerInventoryDB;
USE SellerInventoryDB;
CREATE TABLE Seller(
 SellerID INT PRIMARY KEY,
 SellerName VARCHAR(100),
 Phone VARCHAR(15),
 Email VARCHAR(100),
 City VARCHAR(50)
);
CREATE TABLE Inventory(
 ProductID INT PRIMARY KEY,
 ProductName VARCHAR(100),
 SellerID INT,
 Quantity INT,
 Price DECIMAL(10,2),
 Status VARCHAR(20),
 FOREIGN KEY(SellerID) REFERENCES Seller(SellerID)
);
INSERT INTO Seller VALUES
(101,'Rahul Traders','9876543210','rahul@gmail.com','Chennai'),
(102,'Priya Stores','9123456780','priya@gmail.com','Coimbatore'),
(103,'Arun Enterprises','9988776655','arun@gmail.com','Madurai');
INSERT INTO Inventory VALUES
(201,'Laptop',101,20,55000,'Available'),
(202,'Keyboard',101,0,1200,'Unavailable'),
(203,'Mouse',102,35,700,'Available'),
(204,'Printer',103,5,8500,'Available'),
(205,'Monitor',102,0,12000,'Unavailable');
SELECT * FROM Seller;
SELECT * FROM Inventory;
SELECT S.SellerName,I.ProductName,I.Quantity,I.Price,I.Status
FROM Seller S JOIN Inventory I ON S.SellerID=I.SellerID;
SELECT * FROM Inventory WHERE Status='Available';
SELECT * FROM Inventory WHERE Status='Unavailable';
UPDATE Inventory SET Quantity=15, Status='Available' WHERE ProductID=202;
DELETE FROM Inventory WHERE ProductID=205;
SELECT ProductName,Quantity,Status FROM Inventory;
SELECT S.SellerName,COUNT(I.ProductID) AS TotalProducts
FROM Seller S JOIN Inventory I ON S.SellerID=I.SellerID
GROUP BY S.SellerName;