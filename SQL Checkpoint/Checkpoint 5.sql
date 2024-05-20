CREATE DATABASE Checkpoint4


CREATE TABLE Customer (
Customer_id INT PRIMARY KEY NOT NULL,
Customer_Name VARCHAR(50) NOT NULL,
Customer_adress VARCHAR(50) NOT NULL,
);

SELECT * FROM Customer


-- creating a product table
CREATE TABLE Product(
Product_id INT PRIMARY KEY NOT NULL,
Product_name VARCHAR(50) NOT NULL,
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

INSERT INTO Product (Product_id, Product_name, Product_price)
VALUES (1, 'Cookies', '10'),
		(2, 'Candy', '5.2');

		SELECT * FROM Product

INSERT INTO Customer ( Customer_id, Customer_Name, Customer_adress)
VALUES (1, 'Ahmed', 'Tunisia'),
	(2, 'Coulibaly', 'Senegal'),
	(3, 'Hasan', ' Egypt');

	SELECT * FROM Customer


INSERT INTO Orders ( Order_id, Customer_id, Product_id, Quantity, Order_date)
VALUES (1, '1','2','3','2023-01-22'),
	(2, '2','1','10','2024-04-14');


	UPDATE Orders
	SET Quantity = 6
	Where Order_id=2

	SELECT * FROM Orders

	DELETE FROM Customer
	WHERE Customer_id = 3

	SELECT * FROM Customer


	DELETE FROM Orders
	
	SELECT * FROM Orders

	DROP TABLE Orders
	