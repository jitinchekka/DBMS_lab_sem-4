CREATE DATABASE dblab;
USE dblab;
CREATE TABLE Student (
    RollNo VARCHAR(10),
    SName VARCHAR(10),
    City VARCHAR(10)
);
CREATE TABLE Course (
    CID VARCHAR(10),
    CName VARCHAR(10),
    Credit INT(100)
);
ALTER TABLE Student ADD PRIMARY KEY (RollNo);
ALTER TABLE Course ADD PRIMARY KEY (CID);
--  i) Insertion into table
INSERT INTO Student values('1001', 'A','Hyderabad'), ('1002','B','Hyderabad'),('1003','C','Chennai'),('1004','D','Chennai'),('1005','E','VJA');
INSERT INTO Student values('1006', 'F','Hyderabad'), ('1007','G','Hyderabad'),('1008','H','Chennai'),('1009','I','Chennai'),('1010','J','VJA');
INSERT INTO Course values('CS1001','PSP','5'),('CS1002','DSCS','4'),('CS1003','DSA','4'),('CS1004','OOP','5'),('CS1005','DBMS','5');
INSERT INTO Course values('CS1006','PSPP','5'),('CS1007','LA','4'),('CS1008','DSAP','4'),('DES1002','STD','3'),('DES1003','SPD','5');


-- ii) Display all entrues
SELECT 
    *
FROM
    Student;
SELECT 
    *
FROM
    Course;
    
-- iii) 
ALTER TABLE Student ADD COLUMN department varchar(10);
ALTER TABLE Student ADD COLUMN marks int;

--  iv)
SET SQL_SAFE_UPDATES = 0;
UPDATE Student 
SET 
    department = 'Mechanical'
WHERE
    RollNo = '1001';
UPDATE Student 
SET 
    marks = 70
WHERE
    department = 'Mechanical';
    
-- v)
ALTER TABLE Course MODIFY COLUMN Credit varchar(10);
DESCRIBE Course;

-- vi)
ALTER TABLE Course ADD COLUMN course_addmission_date date;
DESCRIBE Course;
SET SQL_SAFE_UPDATES = 1;