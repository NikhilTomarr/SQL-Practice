-- DATABASE INITIALIZATION
CREATE DATABASE ORG;
SHOW DATABASES;
USE ORG;

-- TABLE CREATION
-- Worker Table
CREATE TABLE Worker (
    WORKER_ID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FIRST_NAME CHAR(25),
    LAST_NAME CHAR(25),
    SALARY INT,
    JOINING_DATE DATETIME,
    DEPARTMENT CHAR(25)
);

INSERT INTO Worker (WORKER_ID, FIRST_NAME, LAST_NAME, SALARY, JOINING_DATE, DEPARTMENT) VALUES
(001, 'Nikhil', 'Tomar', 100000, '2026-05-01 12:00:00', 'Admin'),
(002, 'Sarthak', 'Gurjar', 80000, '2026-05-01 12:00:00', 'HR'),
(003, 'Vivek', 'Dagar', 90000, '2026-05-01 12:00:00', 'Admin'),
(004, 'Rajeev', 'Dagar', 65000, '2026-05-01 12:00:00', 'HR'),
(005, 'Saurabh', 'Lohia', 85000, '2026-05-01 12:00:00', 'Account'),
(006, 'Lakhan', 'Adhana', 70000, '2026-05-01 12:00:00', 'Admin'),
(007, 'Nikil', 'Sardhana', 35000, '2026-05-01 12:00:00', 'Account'),
(008, 'Vipin', 'Mavi', 20000, '2026-05-01 12:00:00', 'Account');


-- Bonus Table
CREATE TABLE Bonus (
    WORKER_REF_ID INT,
    BONUS_AMOUNT INT,
    BONUS_DATE DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID)
    ON DELETE CASCADE
);

INSERT INTO Bonus (WORKER_REF_ID, BONUS_AMOUNT, BONUS_DATE) VALUES
(001, 5000, '2026-05-10 00:00:00'),
(002, 3000, '2026-06-10 00:00:00'),
(003, 4000, '2026-07-10 00:00:00'),
(001, 4500, '2026-07-10 00:00:00'),
(002, 3500, '2026-08-10 00:00:00');


-- Title Table
CREATE TABLE Title (
    WORKER_REF_ID INT,
    WORKER_TITLE CHAR(25),
    AFFECTED_FROM DATETIME,
    FOREIGN KEY (WORKER_REF_ID) REFERENCES Worker(WORKER_ID) 
    ON DELETE CASCADE
);

INSERT INTO Title (WORKER_REF_ID, WORKER_TITLE, AFFECTED_FROM) VALUES
(001, 'CEO', '2026-05-10 00:00:00'),
(002, 'Executive', '2026-06-10 00:00:00'),
(008, 'Executive', '2026-06-10 00:00:00'),
(005, 'Manager', '2026-06-10 00:00:00'),
(004, 'Asst. Manager', '2026-06-10 00:00:00'),
(007, 'Executive', '2026-06-10 00:00:00'),
(006, 'Lead', '2026-06-10 00:00:00'),
(003, 'Lead', '2026-07-26 00:00:00');



-- DATA RETRIEVAL LANGUAGE (DRL) 
SELECT 50+20; 
SELECT now();
SELECT ucase('hlo');
SELECT lcase('HELLO');

SELECT FIRST_NAME, SALARY FROM Worker;

-- WHERE
SELECT * FROM Worker WHERE SALARY > 70000;
SELECT * FROM Worker WHERE DEPARTMENT = 'Admin';

-- salary (50000, 100000) - BETWEEN
SELECT * FROM Worker WHERE SALARY BETWEEN 50000 AND 100000;

-- reduce OR statements
-- HR, ADMIN
SELECT * FROM Worker WHERE DEPARTMENT = 'HR' OR DEPARTMENT = 'Admin';

-- better way use IN 
SELECT * FROM Worker WHERE DEPARTMENT IN ('HR', 'Admin');
SELECT * FROM Worker WHERE DEPARTMENT NOT IN ('HR', 'Admin');

-- check null
SELECT * FROM Worker WHERE DEPARTMENT is NULL;

-- WILDCARD
SELECT * FROM Worker WHERE FIRST_NAME LIKE '%n%';
SELECT * FROM Worker WHERE FIRST_NAME LIKE '_i%';

-- Sorting using ORDER BY
SELECT * FROM Worker ORDER BY SALARY;
SELECT * FROM Worker ORDER BY SALARY DESC;

-- DISTINCT
SELECT DISTINCT DEPARTMENT FROM Worker;

-- GROUP BY
SELECT DEPARTMENT, COUNT(DEPARTMENT) FROM Worker GROUP BY DEPARTMENT;
-- AVG Salary per Department
SELECT DEPARTMENT, AVG(SALARY) FROM Worker GROUP BY DEPARTMENT;
-- MIN
SELECT DEPARTMENT, MIN(SALARY) FROM Worker GROUP BY DEPARTMENT;
-- MAX
SELECT DEPARTMENT, MAX(SALARY) FROM Worker GROUP BY DEPARTMENT;
-- SUM
SELECT DEPARTMENT, SUM(SALARY) FROM Worker GROUP BY DEPARTMENT;

-- GROUP BY HAVING 
SELECT DEPARTMENT, COUNT(Department) FROM Worker GROUP BY DEPARTMENT Having COUNT(Department) > 2;


-- CONSTRAINTS (DDL)
-- Create New Table for PRIMARY KEY, FOREIGN KEY, UNIQUE, CHECK, DEFAULT Queries
CREATE TABLE account (
id INT PRIMARY KEY,
name VARCHAR(255) UNIQUE,
age INT,
CONSTRAINT age_check CHECK(age > 12),
balance INT NOT NULL DEFAULT 0
);

INSERT INTO account(id, name, age, balance)
VALUES (1, 'Nikhil', 18, 1000);

INSERT INTO account(id, name, age)
VALUES (2, 'Sarthak', 18);

-- ALTER OPERATIONS
-- ADD New column
ALTER TABLE account ADD interest FLOAT NOT NULL DEFAULT 0;

-- MODIFY
ALTER TABLE account MODIFY interest DOUBLE NOT NULL DEFAULT 0;
DESC account;

-- CHANGE COLUMN - RENAME THE COLUMN
ALTER TABLE account CHANGE COLUMN interest saving_intererst FLOAT NOT NULL DEFAULT 0;

-- DROP COLUMN
ALTER TABLE account DROP COLUMN saving_intererst;

-- RENAME THE TABLE
ALTER TABLE account RENAME TO account_details;


-- DATA MANIPULATION LANGUAGE (DML)
-- Create New Table for DML Queries
CREATE TABLE Customer (
id INTEGER PRIMARY KEY,
cname VARCHAR(225),
Address VARCHAR(225),
Gender CHAR(2),
City VARCHAR(225),
Pin INTEGER
);

-- INSERT
INSERT INTO customer (id, cname, Address, Gender, City, Pin)
VALUES (1201, 'Ram', 'Ganganagar', 'M', 'Meerut', 25001);

INSERT INTO customer (id, cname, Address, Gender, City, Pin)
VALUES (1203, 'Maya', 'Srinagar', 'F', 'Meerut', 25671),
	   (1208, 'Nik', 'Vijaynagar', 'M', 'Gzb', 25891),
	   (1210, 'Tony', 'Enclave', 'M', 'Noida', 29000);
       
INSERT INTO customer VALUES (1202, 'Mohan', 'Cant', 'M', 'Meerut', 25001);       

INSERT INTO customer (id, cname)
VALUES (1209, 'Alpha');

-- UPDATE
UPDATE Customer SET Address='Mumbai', Gender='M' WHERE id = 1209;

-- UPDATE MULTIPLE ROWS
SET SQL_SAFE_UPDATES = 0;
UPDATE Customer SET Pin = 11000;
UPDATE Customer SET Pin = Pin + 1;
SET SQL_SAFE_UPDATES = 1;

-- DELETE
DELETE FROM Customer WHERE id = 1209;
DELETE FROM Customer;

-- REPLACE - if data already present, replace & data not present, insert
REPLACE INTO Customer (id, City)
VALUES(1201, 'Colony');

REPLACE INTO Customer SET id = 1201, cname = 'Mac', City = 'Noida';

REPLACE INTO Customer (id, cname, City)
SELECT id, cname, City
From Customer WHERE id = 1201;

-- REFERENTAIL CONSTRAINTS -  ON DELETE CASCADE AND  ON DELETE NULL
INSERT INTO customer
VALUES (1201, 'Ram', 'Ganganagar', 'M', 'Meerut', 25001);

CREATE TABLE Order_details (
Order_id INT PRIMARY KEY,
date DATE,
cust_id INT,
FOREIGN KEY(cust_id) REFERENCES Customer(id) ON DELETE CASCADE -- OR ON DELETE NULL OR ON DELETE SET NULL
);

INSERT INTO Order_details
VALUES (3, '2026-05-29', 1201);

DELETE FROM Customer WHERE id = 1201;


-- JOINING TABLES 

CREATE TABLE employee (
id INT PRIMARY KEY,
fname VARCHAR(50),
lname VARCHAR(50),
age INT,
emailID VARCHAR(100),
PhoneNo INT,
City VARCHAR(50)
);

INSERT INTO employee (id, fname, lname, age, emailID, PhoneNo, City)
VALUES  (1, 'Aman', 'Proto', 44, 'aman@gmail.com', 111, 'Delhi'),
        (2, 'Yagya', 'Narayan', 35, 'yagan@gmail.com', 222, 'Palam'),
        (3, 'Rahul', 'BD', 34, 'rahul@gmail.com', 333, 'Bombay'),
        (4, 'Jatin', 'Hermit', 32, 'jatin@gmail.com', 444, 'Raipur'),
        (5, 'PK', 'Pandey', 21, 'pk@gmail.com', 555, 'Jaipur');

CREATE TABLE client (
id INT PRIMARY KEY,
fname VARCHAR(50),
lname VARCHAR(50),
age INT,
emailID VARCHAR(100),
PhoneNo INT,
City VARCHAR(50),
empID INT,
FOREIGN KEY (empID) REFERENCES employee(id)
);

INSERT INTO client (id, fname, lname, age, emailID, PhoneNo, City, empID)
VALUES  (1, 'Mac', 'Proto', 45, 'mac@gmail.com', 111, 'Delhi', 3),
        (2, 'Max', 'Jain', 55, 'max@gmail.com', 222, 'Delhi', 3),
        (3, 'Nik', 'Rogers', 20, 'nik@gmail.com', 333, 'UP', 1),
        (4, 'Pik', 'Son', 25, 'pik@gmail.com', 444, 'KolKata', 5),
        (5, 'Jon', 'Don', 23, 'jon@gmail.com', 555, 'Kolkata', 2);
        
CREATE TABLE project (
id INT PRIMARY KEY,
empID INT,
name VARCHAR(50),
startdate Date,
clientID INT,
FOREIGN KEY (empID) REFERENCES employee(id),
FOREIGN KEY (clientID) REFERENCES client(id)
);

INSERT INTO project (id, empID, name, startdate, clientID)
VALUES  (1, 1, 'A', '2000-01-01', 3),
        (2, 2, 'B', '2000-05-01', 1),
        (3, 3, 'C', '2000-06-01', 5),
        (4, 3, 'D', '2000-01-08', 2),
        (5, 5, 'E', '2000-08-09', 4);
        
-- INNER JOIN 
-- Enlist all the employees ID's names along with the Project allocated to them.
SELECT e.id, e.fname, e.lname, p.id, p.name FROM employee AS e
INNER JOIN project AS p ON e.id = p.empID;

-- INNER JOIN without using JOIN keywords
SELECT e.id, e.fname, e.lname, p.id, p.name FROM employee AS e,
project AS p WHERE e.id = p.empID;

-- Fetch out all the employee ID's and their contact detail who have been working
-- from Jaipur with the clients name working in Kolkata.
SELECT e.id, e.emailID, e.PhoneNo, c.fname, c.lname FROM employee AS e
INNER JOIN client AS c ON e.id = c.empID WHERE e.City = 'Jaipur' AND c.City = 'Kolkata';

-- LEFT JOIN
-- Fetch out each project allocated to each employee
SELECT * FROM employee AS e
LEFT JOIN project AS p ON e.id = p.empID;

-- RIGHT JOIN
-- List out all the project along with the employee's name and their respective allocated email ID
SELECT p.id,  p.name, e.fname, e.lname, e.emailID FROM employee AS e
RIGHT JOIN project AS p
ON e.id = p.empID;

-- CROSS JOIN
-- List out all the combinations possible for the employee's name and projects that can exist.
SELECT e.fname, e.lname, p.id, p.name FROM employee AS e
CROSS JOIN project AS p;

-- SET OPERATIONS

CREATE TABLE dept1 (
empid INT PRIMARY KEY,
name VARCHAR(50),
role VARCHAR (50)
);

INSERT INTO dept1 (empid, name, role)
VALUES (1, 'A', 'Engineer'),
       (2, 'B', 'Salesman'),
       (3, 'C', 'Manager'),
       (4, 'D', 'Salesman'),
       (5, 'E', 'Engineer');

CREATE TABLE dept2 (
empid INT PRIMARY KEY,
name VARCHAR(50),
role VARCHAR (50)
);

INSERT INTO dept2 (empid, name, role)
VALUES (3, 'C', 'Manager'),
       (6, 'F', 'Marketing'),
       (7, 'G', 'Salesman');
      
-- List out all the employees in the company 
-- UNION
SELECT * FROM dept1
UNION
SELECT * FROM dept2;      
      
-- List out all employees in all departments who work as saleman 
SELECT * FROM dept1 WHERE role = 'Salesman'
UNION
SELECT * FROM dept2 WHERE role = 'Salesman';

-- List out all the employees who work for both the departments
-- INTERSECT
SELECT dept1.* FROM dept1 INNER JOIN dept2 USING (empid);

-- List out all the employees working in dept1 but not in dept2
-- MINUS
SELECT dept1.* FROM dept1 LEFT JOIN dept2 USING(empid)
WHERE dept2.empid IS NULL;

-- SUB QUERIES
-- WHERE clause same table
-- employees with age > 30
SELECT * FROM employee WHERE age  IN (SELECT age FROM employee WHERE age > 30);

-- WHERE clause different table
-- emp details working in more than 1 project
SELECT * FROM employee WHERE id IN (
SELECT empID FROM project GROUP BY  empID HAVING COUNT(empID) > 1
);

-- single value subquery
-- emp details having age > avg(age)
SELECT * FROM employee WHERE age > (SELECT AVG(age) FROM employee);

-- FROM clause - derived tables
-- select max age person whose first name contains 'a'
SELECT MAX(age) FROM (SELECT * FROM employee WHERE fname LIKE '%a%') AS temp;

-- Corelated SUbquery
-- find 3rd oldest employee
SELECT * FROM employee e1 
WHERE 3 = (
SELECT COUNT(e2.age)
FROM employee e2
WHERE e2.age >= e1.age
);

-- VIEW
SELECT * FROM employee;

-- CREATING A VIEW
CREATE VIEW custom_view AS SELECT fname, age FROM employee;

-- VIEWING FROM VIEW
SELECT * FROM custom_view;

-- ALTERING THE VIEW 
ALTER VIEW custom_view AS SELECT fname, lname, age FROM employee;


-- DROPING THE VIEW
DROP VIEW IF EXISTS custom_view;
