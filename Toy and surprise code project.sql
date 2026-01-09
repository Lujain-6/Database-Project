CREATE DATABASE Toy_and_Surprise_Store;
USE Toy_and_Surprise_Store;

CREATE TABLE Customers (
    Customer_ID  VARCHAR(10) PRIMARY KEY,
    First_Name VARCHAR(25),
    Middle_Name VARCHAR(25),
    Last_Name VARCHAR(25),
    Email VARCHAR(80) UNIQUE NOT NULL,
    Total_Points INT DEFAULT 0 CHECK (Total_Points >= 0),
    Membership_Level char(30)
);

CREATE TABLE Employees (
    Employee_ID varchar(10) PRIMARY KEY,
    First_Name VARCHAR(25) NOT NULL,
    Middle_Name VARCHAR(25) NOT NULL,
    Last_Name VARCHAR(25) NOT NULL,
    Email VARCHAR(80) UNIQUE NOT NULL,
    Salary DECIMAL(10,2) NOT NULL CHECK (Salary > 0),
    Hiring_Date DATE NOT NULL,
    Job_Role ENUM('Marketer','Cashier','Call Center','Exhibition Manager','Salesperson','Event Coordinator','Team Supervisor') NOT NULL
);

CREATE TABLE Employee_Mobile_Number (
    Mobile_Number_ID VARCHAR(15),
     Employee_ID varchar(10),
    PRIMARY KEY (Mobile_Number_ID, Employee_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_ID)
    ON DELETE RESTRICT
);

CREATE TABLE Products (
    Product_ID  VARCHAR(10) PRIMARY KEY,
    Product_Name VARCHAR(30) NOT NULL,
    Description TEXT,
    Price DECIMAL(10,2) NOT NULL CHECK (Price > 0),
    Available_Quantity INT DEFAULT 0 CHECK (Available_Quantity >= 0),
    Target_Gender ENUM ('Male','Female') NOT NULL,
    Target_Age ENUM('0-6 months', '6-12 months', '1-3 years', '3-6 years', '6-12 years', '+12 years') NOT NULL
);

CREATE TABLE Status (
    Status_ID VARCHAR(10) PRIMARY KEY,
     Status_Name ENUM('Processing','Confirmed','Delivered','Pending','Canceled','Failed') NOT NULL

);

CREATE TABLE Orders (
    Order_ID VARCHAR(10) PRIMARY KEY,
    Order_Date DATE NOT NULL,
    Payment_Method ENUM('Cash', 'Card') NOT NULL,
    Total_Amount DECIMAL(10,2) NOT NULL CHECK (Total_Amount >= 0),
    Customer_ID VARCHAR(10),
    Status_ID VARCHAR(10),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
    ON DELETE RESTRICT,
    FOREIGN KEY (Status_ID) REFERENCES Status(Status_ID)
    ON DELETE RESTRICT
);

CREATE TABLE Assist (
    Customer_ID VARCHAR(10),
    Employee_ID VARCHAR(10),
    PRIMARY KEY (Customer_ID, Employee_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
    ON DELETE RESTRICT,
    FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_ID)
    ON DELETE RESTRICT
);

CREATE TABLE Handel (
    Employee_ID VARCHAR(10),
    Order_ID VARCHAR(10),
    PRIMARY KEY (Employee_ID, Order_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Employees(Employee_ID)
    ON DELETE RESTRICT,
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
    ON DELETE RESTRICT
);

CREATE TABLE Include (
    Order_ID VARCHAR(10),
    Product_ID VARCHAR(10),
    PRIMARY KEY (Order_ID, Product_ID),
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
    ON DELETE RESTRICT,
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
    ON DELETE RESTRICT
);

CREATE TABLE Try (
    Customer_ID VARCHAR(10),
    Product_ID VARCHAR(10),
    PRIMARY KEY (Customer_ID, Product_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
    ON DELETE RESTRICT,
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
    ON DELETE RESTRICT
);

CREATE TABLE Place (
    Customer_ID VARCHAR(10),
    Order_ID VARCHAR(10),
    PRIMARY KEY (Customer_ID, Order_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)
    ON DELETE RESTRICT,
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)
    ON DELETE RESTRICT
);

INSERT INTO Customers (Customer_ID, First_Name, Middle_Name, Last_Name, Email, Total_Points, Membership_Level) VALUES
('C023','Ahmed', 'Ali', 'Al-Zaid','C023@gmail.com',750,'Gold'),
('C024','Sara', 'Mohammed', 'Al-Khalid','C024@gmail.com',1200,'Platinum'),
('C025','Mohammed', 'Khalid', 'Al-Saad','C025@gmail.com',300,'Silver'),
('C026','Lina', 'Fahd', 'Al-Jabri','C026@gmail.com',950,'Gold'),
('C027','Nawaf', 'Abdullah', 'Al-Ghanim','C027@gmail.com',450,'Silver'),
('C028','Fahd', 'Saud', 'Al-Qarni','C028@gmail.com',1800,'Platinum'),
('C029','Hana', 'Abdullah', 'Al-Otaibi','C029@gmail.com',650,'Gold'),
('C030','Abdulaziz', 'Nasser', 'Al-Fahid','C030@gmail.com',1100,'Platinum'),
('C031','Mai', 'Saleh', 'Al-Manea','C031@gmail.com',850,'Gold'),
('C032','Turki', 'Mohammed', 'Al-Shehri','C032@gmail.com',1250,'Platinum');

INSERT INTO Employees (Employee_ID, First_Name, Middle_Name, Last_Name, Email, Salary, Hiring_Date, Job_Role) VALUES
('E023','Khalid', 'Saad', 'Al-Fahid', 'khaled@toystore.com',8500,'2023-01-15','Salesperson'),
('E024','Nora', 'Ahmed', 'Al-Rashid', 'nora@toystore.com',9200,'2022-06-10','Team Supervisor'),
('E025','Omar', 'Mohammed', 'Al-Ghamdi', 'omar@toystore.com',7800,'2024-03-01','Cashier'),
('E026','Lama', 'Abdullah', 'Al-Zaidi', 'lama@toystore.com',8100,'2023-08-20','Call Center'),
('E027','Faisal', 'Nasser', 'Al-Salim', 'faisal@toystore.com',8800,'2022-11-05','Salesperson'),
('E028','Maha', 'Ahmed', 'Al-Harbi', 'maha@toystore.com',7600,'2023-05-20','Cashier'),
('E029','Abdullah', 'Ibrahim', 'Al-Mutairi', 'abdullah@toystore.com',9500,'2022-03-15','Team Supervisor'),
('E030','Reem', 'Salem', 'Al-Amri', 'reem@toystore.com',7200,'2024-01-10','Salesperson'),
('E031','Majed', 'Fahad', 'Al-Shammari', 'majed@toystore.com',8300,'2023-11-30','Team Supervisor'),
('E032','Nouf', 'Khalid', 'Al-Qahtani', 'nouf@toystore.com',7900,'2023-09-25','Call Center');

INSERT INTO Employee_Mobile_Number (Employee_ID, Mobile_Number_ID) VALUES
('E023', '+996582751130'),
('E024', '0503334444'),
('E025', '0515556666'),
('E026', '0527778888'),
('E027', '0539990000'),
('E028', '0541113333'),
('E029', '0552224444'),
('E030', '0563335555'),
('E031', '0574446666'),
('E032', '0585557777');

INSERT INTO Products (Product_ID, Product_Name, Description, Price, Available_Quantity,Target_Gender,Target_Age ) VALUES
('P001','Remote Control Car','Sports car operated by remote control - high speed',149.99,25,'Male', '6-12 years'),
('P002','Talking Moving Doll','Smart doll that talks, moves and sings',89.50,15,'Female', '3-6 years'),
('P003','Building Blocks Game','200 colorful pieces for creativity development',75.00,40,'Male', '1-3 years'),
('P004','Electric Train','Complete train set with track',199.99,10,'Male', '6-12 years'),
('P005','Spiderman Toys','Set of moving Spiderman toys',55.00,30,'Male', '6-12 years'),
('P006','Drone Aircraft','Small aircraft with video recording',299.99,8,'Male', '+12 years'),
('P007','Kids Cooking Game','Complete kitchen set with tools',120.00,20,'Female', '3-6 years'),
('P008','Intelligence Puzzle','Mind development puzzle game',45.50,35,'Female', '3-6 years'),
('P009','Robot Dog','Interactive robotic dog with sensors',179.99,12,'Male', '6-12 years'),
('P010','Water Gun Set','Complete water gun set for summer',39.99,50,'Male', '6-12 years');

INSERT INTO Status (Status_ID, Status_Name) VALUES
('S01','Processing'),
('S02','Confirmed'),
('S03','Delivered'),
('S04','Pending'),
('S05','Canceled'),
('S06','Failed');

INSERT INTO Orders (Order_ID, Order_Date, Payment_Method, Total_Amount, Customer_ID, Status_ID) VALUES
('O01','2024-10-01','Card',149.99,'C023','S03'),
('O02','2024-10-02','Card',245.00,'C024','S01'),
('O03','2024-10-03','Cash',75.00,'C025','S02'),
('O04','2024-10-04','Cash',374.99,'C026','S04'),
('O05','2024-10-05','Card',120.00,'C027','S05'),
('O06','2024-10-06','Card',299.99,'C028','S04'),
('O07','2024-10-07','Cash',165.00,'C029','S01'),
('O08','2024-10-08','Cash',89.50,'C030','S05'),
('O09','2024-10-09','Cash',240.00,'C031','S06'),
('O10','2024-10-10','Card',195.50,'C032','S06');

INSERT INTO Assist (Customer_ID, Employee_ID) VALUES
('C023','E023'),
('C024','E024'),
('C025','E025'),
('C026','E026'),
('C027','E027'),
('C028','E028'),
('C029','E029'),
('C030','E030'),
('C031','E031'),
('C032','E032'),
('C023','E024');

INSERT INTO Handel (Employee_ID, Order_ID) VALUES
('E023','O01'),
('E024','O02'),
('E025','O03'),
('E026','O04'),
('E027','O05'),
('E028','O06'),
('E029','O07'),
('E030','O08'),
('E031','O09'),
('E032','O10'),
('E023','O02');

INSERT INTO Include (Order_ID, Product_ID) VALUES
('O01','P001'),
('O02','P001'),
('O02','P003'),
('O02','P008'),
('O03','P003'),
('O04','P001'),
('O04','P004'),
('O05','P007'),
('O06','P006'),
('O07','P002'),
('O07','P005'),
('O07','P008');

INSERT INTO Try (Customer_ID, Product_ID) VALUES
('C023','P001'),
('C023','P003'),
('C024','P002'),
('C025','P004'),
('C026','P005'),
('C027','P006'),
('C028','P007'),
('C029','P008'),
('C030','P009'),
('C031','P010'),
('C032','P001');

INSERT INTO Place (Customer_ID, Order_ID) VALUES
('C023','O01'),
('C024','O02'),
('C025','O03'),
('C026','O04'),
('C027','O05'),
('C028','O06'),
('C029','O07'),
('C030','O08'),
('C031','O09'),
('C032','O10');


SELECT * FROM Customers;
SELECT * FROM Employees;
SELECT * FROM Employee_Mobile_Number;
SELECT * FROM Products;
SELECT * FROM Status;
SELECT * FROM Orders;
SELECT * FROM Assist;
SELECT * FROM Handel;
SELECT * FROM Include;
SELECT * FROM Try;
SELECT * FROM Place;

DESCRIBE Customers;
DESCRIBE Employees;
DESCRIBE Employee_Mobile_Number;
DESCRIBE Products;
DESCRIBE Status;
DESCRIBE Orders;
DESCRIBE Assist;
DESCRIBE Handel;
DESCRIBE Include;
DESCRIBE Try;
DESCRIBE Place;




-- Basic SELECT Queries


-- Display specific columns with a condition
-- This query displays customers who have more than 1000 loyalty points
SELECT Customer_ID, First_Name, Last_Name, Total_Points
FROM Customers
WHERE Total_Points > 1000;

-- Display specific columns with a condition
-- This query displays products that cost less than 100 
SELECT Product_ID, Product_Name, Price
FROM Products
WHERE Price < 100;


-- Aggregate Functions


-- COUNT() with GROUP BY
-- This query counts how many orders were made for each payment method
SELECT Payment_Method, COUNT(Order_ID) AS total_orders
FROM Orders
GROUP BY Payment_Method;

-- AVG() aggregate function
-- This query calculates the average salary of all employees
SELECT AVG(Salary) AS average_salary
FROM Employees;



-- JOIN Queries


-- INNER JOIN between Orders and Customers
-- This query displays orders with the customer full name
SELECT O.Order_ID, O.Order_Date, C.First_Name, C.Last_Name
FROM Orders O
INNER JOIN Customers C
ON O.Customer_ID = C.Customer_ID;

-- INNER JOIN between Include and Products
-- This query displays each order with its products 
SELECT I.Order_ID, P.Product_Name
FROM Include I
INNER JOIN Products P
ON I.Product_ID = P.Product_ID;




-- Subqueries


-- Subquery using AVG()
-- This query displays products that are more expensive than the average product price
SELECT Product_Name, Price
FROM Products
WHERE Price > (
    SELECT AVG(Price)
    FROM Products
);

-- Subquery using IN
-- This query displays customers who have placed at least one order
SELECT Customer_ID, First_Name, Last_Name
FROM Customers
WHERE Customer_ID IN (
    SELECT Customer_ID
    FROM Orders
);


UPDATE Products
SET Price = Price + 10
WHERE Product_ID = 'P001';

DELETE FROM Try
WHERE Customer_ID = 'C026'
  AND Product_ID = 'P005';



-- Create a view
-- This view displays delivered orders with customer information
CREATE VIEW Delivered_Orders AS
SELECT O.Order_ID, O.Order_Date, O.Total_Amount,
       C.First_Name, C.Last_Name
FROM Orders O
INNER JOIN Customers C
ON O.Customer_ID = C.Customer_ID
WHERE O.Status_ID = 'S03';

-- Display data from the view
SELECT * FROM Delivered_Orders;  

--  Retrieves Platinum member to identify high-value customers for exclusive offers. 
SELECT Customer_ID, Email, Total_Points, Membership_Level 
FROM Customers 
WHERE Membership_Level = 'Platinum'  
ORDER BY Total_Points DESC;

-- Finds products that out-of-stock to manage stock replenishment. 
SELECT Product_ID, Product_Name, Price, Available_Quantity 
FROM Products 
WHERE Available_Quantity = 0; 

-- COUNT() aggregate function 
-- with GROUP BY 
-- Counts how many employees work in each job type. 
SELECT Job_Role, 
COUNT(*) AS Employee_Count 
FROM Employees 
GROUP BY Job_Role;

-- COUNT() aggregate function 
-- Counts how many customers placed orders on 2024-10-01. 
SELECT COUNT(DISTINCT Customer_ID) AS Customer_Count 
FROM Orders 
WHERE Order_Date = '2024-10-01';

-- JOIN between Try and Products 
-- Shows product trials with actual product names. 
SELECT T.Customer_ID, P.Product_Name 
FROM Try T 
JOIN Products P ON T.Product_ID = P.Product_ID 
ORDER BY T.Customer_ID, P.Product_Name; 

-- JOIN between Customers and Orders 
-- Shows each customer's total orders. 
SELECT C.Customer_ID, C.First_Name, 
COUNT(O.Order_ID) AS Order_Count 
FROM Customers C 
JOIN Orders O ON C.Customer_ID = O.Customer_ID 
GROUP BY C.Customer_ID, C.First_Name;

-- Subquery using IN 
-- This query displays customers who have placed at least one order 
SELECT Customer_ID, First_Name, Last_Name 
FROM Customers 
WHERE Customer_ID IN ( 
SELECT Customer_ID 
FROM Orders 
);

-- Subquery using IN
-- Shows products priced below average product price.
SELECT Product_Name, Price
FROM Products
WHERE Price IN (
    SELECT Price
    FROM Products
    WHERE Price < (
        SELECT AVG(Price)
        FROM Products)
);

-- Subquery using MAX
-- Shows details of the order with the highest total amount.
SELECT Order_ID, Customer_ID, Total_Amount
FROM Orders
WHERE Total_Amount IN (
    SELECT MAX(Total_Amount)
    FROM Orders
);


-- Subquery using comparison operator
-- Finds products priced above the average price of all toys in the store.
SELECT Product_Name, Price 
FROM Products 
WHERE Price > (SELECT AVG(Price) FROM Products);

-- Subquery using IN
-- get the name of the customers who got helped bt employee number E027
SELECT First_Name, Last_Name 
FROM Customers 
WHERE Customer_ID IN (SELECT Customer_ID FROM Assist WHERE Employee_ID = 'E027');

-- Subquery using NOT IN
-- Lists products that have never been included in any order.
SELECT Product_Name 
FROM Products 
WHERE Product_ID NOT IN (SELECT DISTINCT Product_ID FROM Include);

-- View Queries
-- This view displays delivered orders with customer information
CREATE VIEW Delivered_Orders AS
SELECT O.Order_ID, O.Order_Date, O.Total_Amount,
       C.First_Name, C.Last_Name
FROM Orders O
INNER JOIN Customers C
ON O.Customer_ID = C.Customer_ID
WHERE O.Status_ID = 'S03';

-- Display data from the view
SELECT * FROM Delivered_Orders;

-- helping identify what Product is Below the Average.
CREATE VIEW Below_Average_Price_Products AS
SELECT Product_Name, Price
FROM Products
WHERE Price < (
    SELECT AVG(Price)
    FROM Products
);

-- Display data from the view
SELECT * FROM Below_Average_Price_Products;

-- Check if a customer has any related orders before deletion
SELECT *
FROM Orders
WHERE Customer_ID = 'C040';

-- Delete a customer who has no related orders
-- This operation succeeds because there are no FK restrictions
DELETE FROM Customers
WHERE Customer_ID = 'C040';

-- Remove a specific product trial record for a customer
DELETE FROM Try
WHERE Customer_ID = 'C026'
  AND Product_ID = 'P005';

-- Update the price of a specific product by increasing it by 10
UPDATE Products
SET Price = Price + 10
WHERE Product_ID = 'P001';
