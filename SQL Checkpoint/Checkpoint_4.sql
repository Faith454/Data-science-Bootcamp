CREATE DATABASE Checkpoint_4

CREATE TABLE Customer (
Customer_id INT PRIMARY KEY NOT NULL,
Customer_Name VARCHAR(50) NOT NULL,
Customer_adress VARCHAR(50) NOT NULL,
);

SELECT * FROM Customer


-- creating a product table
CREATE TABLE Product(
Product_id INT PRIMARY KEY NOT NULL,
Product_name VARCHAR NOT NULL,
Product_price DECIMAL (10,2) CHECK(Product_price > 0) NOT NULL,
);

SELECT * FROM Product

--creating an order table
CREATE TABLE Orders(
Order_id INT PRIMARY KEY NOT NULL,
Customer_id INT FOREIGN KEY REFERENCES Customer (Customer_id) NOT NULL,
Product_id INT FOREIGN KEY REFERENCES Product (Product_id) NOT NULL,
Quantity INT NOT NULL,
Order_date DATE NOT NULL,
);

SELECT * FROM Orders