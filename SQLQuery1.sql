CREATE DATABASE EmployeeDB;

USE EmployeeDB;

CREATE TABLE Department (
    DepartId INT PRIMARY KEY,
    DepartName VARCHAR(50) NOT NULL,
    Description VARCHAR(100) NOT NULL,
);

CREATE TABLE Employee (
    EmpCode CHAR(6) PRIMARY KEY,
    FirstName VARCHAR(30) NOT NULL,
    LastName VARCHAR(30) NOT NULL,
    Birthday SMALLDATETIME NOT NULL,
    Gender BIT DEFAULT 1,
    Address VARCHAR(100),
    DepartID INT,
    Salary MONEY,
    FOREIGN KEY (DepartID) REFERENCES Department(DepartId)
);

INSERT INTO Department (DepartId, DepartName, Description) VALUES
(1, 'Sales', 'Sales department'),
(2, 'HR', 'Human Resources department'),
(3, 'IT', 'Information Technology department');

INSERT INTO Employee (EmpCode, FirstName, LastName, Birthday, Gender, Address, DepartID, Salary) VALUES
('E001', 'Nguyen', 'Van A', '1985-01-01', 1, '123 Le Loi, Hanoi', 1, 1000),
('E002', 'Tran', 'Thi B', '1990-02-02', 0, '456 Tran Phu, Ho Chi Minh', 2, 2000),
('E003', 'Le', 'Van C', '1995-03-03', 1, '789 Nguyen Trai, Da Nang', 3, 3000);

UPDATE Employee
SET Salary = Salary * 1.10;

ALTER TABLE Employee
ADD CONSTRAINT chk_Salary CHECK (Salary > 0);