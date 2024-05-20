
CREATE DATABASE Checkpoint_6

CREATE TABLE Customer(
Customer_Id INT PRIMARY KEY NOT NULL,
Customer_Name VARCHAR(50) NOT NULL,
Customer_Tel CHAR (20) Check (Customer_Tel Like '[0-9][0-9][0-9]-[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]')NOT NULL,
);

SELECT * FROM Customer

CREATE TABLE Product(
Procut_Id INT PRIMARY KEY NOT NULL,
Product_Name VARCHAR(50) NOT NULL,
Product_Category VARCHAR (50) NOT NULL,
Product_Price DECIMAL (10,2) CHECK(Product_price > 0) NOT NULL,
);

SELECT * FROM Product

SP_RENAME 'Product.Procut_Id', 'Product_Id'

SELECT * FROM Product


CREATE TABLE Orders(
Order_id INT PRIMARY KEY NOT NULL,
Customer_id INT FOREIGN KEY REFERENCES Customer (Customer_id) NOT NULL,
Product_id INT FOREIGN KEY REFERENCES Product (Product_Id) NOT NULL,
Quantity INT NOT NULL,
Order_date DATE NOT NULL,
Total_amount INT NOT NULL);

SELECT * FROM Orders


INSERT INTO Product (Product_Id, Product_name, Product_Category, Product_Price)
VALUES (1, 'Widget', 'Software', 10.0),
		(2, 'Gadget', 'Electronics', 20.0),
		(3, 'Doohickey','Device', 15.00);

SELECT * FROM Product

INSERT INTO Customer ( Customer_id, Customer_Name, Customer_Tel)
VALUES (1, 'Alice', '123-334-4454'),
	(2, 'Bob', '910-023-1028'),
	(3, 'Charlie', '456-644-3504');

	SELECT * FROM Customer

	INSERT INTO Orders ( Order_id, Customer_id, Product_id, Quantity, Order_date, Total_amount)
VALUES (1, 1, 1, 10, '2021-01-01', 10 * 10),
		(2, 1, 2, 5, '2021-01-02', 5 * 20),
		(3, 2, 1, 3, '2021-01-03', 3 * 10)
	

	Drop Table Orders

	SELECT * FROM Orders
	--	(4, 2, 2, 7, '2021-01-04', 7 * 20),
	--	(5, 3, 1, 2, '2021-01-05', 2 * 10),
	--	(6, 3, 3, 3, '2021-01-06', 3 * 15);

	SELECT * FROM Orders

	CREATE TABLE Orders(
Order_id INT PRIMARY KEY NOT NULL,
Customer_id INT FOREIGN KEY REFERENCES Customer (Customer_id) NOT NULL,
Product_id INT FOREIGN KEY REFERENCES Product (Product_Id) NOT NULL,
Quantity INT NOT NULL,
Order_date DATE NOT NULL,
Total_amount INT NOT NULL);

SELECT * FROM Orders

	INSERT INTO Orders ( Order_id, Customer_id, Product_id, Quantity, Order_date, Total_amount)
VALUES (1, 1, 1, 10, '2021-01-01', 10 * 10),
		(2, 1, 2, 5, '2021-01-02', 5 * 20),
		(3, 2, 1, 3, '2021-01-03', 3 * 10),
		(4, 2, 2, 7, '2021-01-04', 7 * 20),
		(5, 3, 1, 2, '2021-01-05', 2 * 10),
		(6, 3, 3, 3, '2021-01-06', 3 * 15);



		SELECT * FROM Orders
		SELECT * FROM Product
		SELECT * FROM Customer

--   Write a SQL query to retrieve the names of the customers who have placed an order for at least one widget and at least one gadget, along with the total cost of the widgets and gadgets ordered by each customer. The cost of each item should be calculated by multiplying the quantity by the price of the product.




SELECT O.Order_id, C.Customer_Id, C.Customer_Name, P.Product_Name, O.Quantity, O.Total_amount,O.Order_date
FROM Orders AS O
JOIN Customer AS C on (C.Customer_Id=O.Customer_id)
JOIN Product AS P on (P.Product_Id=O.Product_id);


--Finding Customer who only ordered at least one Widget or Gadget.
SELECT O.Order_id, C.Customer_Id, C.Customer_Name, P.Product_Name, O.Quantity, O.Total_amount,O.Order_date
FROM Orders AS O
JOIN Customer AS C on (C.Customer_Id=O.Customer_id)
JOIN Product AS P on (P.Product_Id=O.Product_id)
WHERE  Product_Name IN ('Widget', 'Gadget') AND Quantity >=1;



--Write a query to retrieve the names of the customers who have placed an order for at least one widget, along with the total cost of the widgets ordered by each customer.

SELECT C.Customer_Id, C.Customer_Name, P.Product_Name, O.Total_amount
FROM Orders AS O
JOIN Customer AS C on (C.Customer_Id=O.Customer_id)
JOIN Product AS P on (P.Product_Id=O.Product_id)
WHERE  Product_Name IN ('Widget') AND Quantity >=1;



--Write a query to retrieve the names of the customers who have placed an order for at least one gadget, along with the total cost of the gadgets ordered by each customer.

SELECT C.Customer_Id, C.Customer_Name, P.Product_Name, O.Total_amount
FROM Orders AS O
JOIN Customer AS C on (C.Customer_Id=O.Customer_id)
JOIN Product AS P on (P.Product_Id=O.Product_id)
WHERE  Product_Name IN ('Gadget') AND Quantity >=1;



--Write a query to retrieve the names of the customers who have placed an order for at least one doohickey, along with the total cost of the doohickeys ordered by each customer.

SELECT C.Customer_Id, C.Customer_Name, P.Product_Name, O.Total_amount
FROM Orders AS O
JOIN Customer AS C on (C.Customer_Id=O.Customer_id)
JOIN Product AS P on (P.Product_Id=O.Product_id)
WHERE  Product_Name IN ('doohickey') AND Quantity >=1;


--Write a query to retrieve the total number of widgets and gadgets ordered by each customer, along with the total cost of the orders.


SELECT C.Customer_Id, C.Customer_Name,
SUM(CASE WHEN P.Product_Name='Widget' THEN O.Quantity ELSE 0 END) AS Total_Widget,
SUM(CASE WHEN P.Product_Name= 'Gadget' THEN O.Quantity ELSE 0 END) AS Total_Gadget,
SUM(O.Total_Amount) AS Total_Cost
FROM Orders AS O
JOIN Customer AS C ON C.Customer_Id=O.Customer_id
JOIN Product AS P ON P.Product_Id=O.Product_id
WHERE P.Product_Name IN ('Widget', 'Gadget')
GROUP BY C.Customer_Id, C.Customer_Name;



--Write a query to retrieve the names of the products that have been ordered by at least one customer, along with the total quantity of each product ordered

SELECT P.Product_Name,
SUM(O.Quantity) AS Total_Quantity_Ordered
FROM Orders AS O
JOIN Product AS P ON P.Product_Id = O.Product_id
GROUP BY P.Product_Name
HAVING SUM(O.Quantity) >= 1;




--Write a query to retrieve the names of the customers who have placed the most orders, along with the total number of orders placed by each customer.

SELECT C.Customer_Id, C.Customer_Name,
COUNT(O.Order_id) AS Total_Orders_Placed
FROM Orders AS O
JOIN Customer AS C ON C.Customer_Id = O.Customer_id
GROUP BY C.Customer_Id, C.Customer_Name
ORDER BY Total_Orders_Placed DESC;


--Write a query to retrieve the names of the products that have been ordered the most, along with the total quantity of each product ordered.

SELECT P.Product_Name,
SUM(O.Quantity) AS Total_Quantity_Ordered
FROM Orders AS O
JOIN Product AS P ON P.Product_Id = O.Product_id
GROUP BY P.Product_Name
ORDER BY Total_Quantity_Ordered DESC;



--Write a query to retrieve the names of the customers who have placed an order on every day of the week, along with the total number of orders placed by each customer.

SELECT C.Customer_Id, C.Customer_Name,
COUNT(DISTINCT DATEPART(dw, O.Order_date)) AS Days_With_Orders
FROM Orders AS O
JOIN Customer AS C ON C.Customer_Id = O.Customer_id
GROUP BY C.Customer_Id, C.Customer_Name
HAVING COUNT(DISTINCT DATEPART(dw, O.Order_date)) = 7;