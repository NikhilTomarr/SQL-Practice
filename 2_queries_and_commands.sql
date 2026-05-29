USE org;

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
