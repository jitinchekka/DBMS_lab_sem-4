CREATE DATABASE dblab1;
USE dblab1;
-- Student( RollNo char (8), SName varchar (20), Gender char (1), City varchar(20))
CREATE TABLE student (
    RollNo CHAR(8),
    SName VARCHAR(20),
    Gender CHAR(1),
    City VARCHAR(20)
);
ALTER TABLE student ADD PRIMARY KEY (RollNo);
-- Course (CCode char(5), CName varchar(20), Credit smallint)
CREATE TABLE Course (
    CCode CHAR(5),
    CName VARCHAR(20),
    Credit SMALLINT
);
ALTER TABLE Course ADD PRIMARY KEY (CCode);

-- Enrolled (RollNo char(8), CCode char(5), YoE int) -- 
CREATE TABLE Enrolled (
    RollNo CHAR(8),
    FOREIGN KEY (RollNo)
        REFERENCES student (RollNo),
    CCode CHAR(5),
    YoE INT,
    FOREIGN KEY (CCode)
        REFERENCES Course (CCode)
);

describe Student;
describe Course;
DESCRIBE Enrolled;

-- In the Course table add a column course type (CType varchar(20)). This CType will take a
-- value from Core, Elective, or Open Elective. In the Student table add a column Email of
-- varchar(30). This column should be unique and only one email value is to be inserted. Insert
-- email values in “username@domain-name” format.

alter table course ADD CType varchar(20);
ALTER table student ADD Email varchar(30) unique;

-- Inserting values
INSERT INTO student values('1901CS01',"abc",'M',"Hyderabad","abc@gmail.com"),
('1901CS02','abcd','M','Hyderabad',"abcd@gmail.com"),
('1901EC01','bb','F','Chennai',"bb@yahoo.com"),
('1901CS03','aa','M','Hyderabad',"aa@gmail.com"),
('1901EC02','aaa','F','Delhi',"aaa@yahoo.com"),
('1901ME01','ab','F','Delhi',"ab@gmail.com"),
('1901CS04','ac','F',"Chennai","ac@gmail.com"),
('1901EC03','abbb','Delhi',"abbb@gmail.com");
INSERT INTO Student values('1901CS99',"abccc","M","Delhi","abccc@yahoo.com");
select * FROM Student;
INSERT INTO course values ("CS100","PSP",4,"Core"),("CS101","DSCS",2,"Core"),("CS501","OS",3,"Elective"),("CS502","CD",4,"Elective"),("CS201","DBMS",4,"Open ELective"),
("EC101","DSD",4,"Core"),("EC500","IOT",4,"Open ELective"),("EC201","ET",4,"Elective"),("ME101","MSE",4,"Core");
select * FROM Course;
INSERT INTO Enrolled values ("1901CS01","CS100",2019),("1901CS01","CS101",2020),("1901CS01","CS501",2020);
INSERT INTO Enrolled values ("1901CS02","CS502",2017),("1901CS02","CS502",2020);
insert into Enrolled values ("1901EC01","CS100",2019),("1901EC01","EC101",2018),("1901EC01","EC500",2020),("1901EC01","EC201",2019),("1901EC01","CS101",2019);
INSERT INTO Enrolled values ("1901CS03","CS100",2019),("1901CS03","CS101",2020),("1901CS03","CS501",2020);
INSERT INTO Enrolled values ("1901ME01","CS100",2020),("1901CS03","CS101",2020),("1901CS03","ME101",2020),("1901CS03","CS201",2020),("1901CS03","EC101",2020);
INSERT INTO Enrolled values ("1901EC02","CS100",2020),("1901EC02","CS101",2020),("1901EC02","ME101",2020),("1901EC02","CS201",2020);
INSERT INTO Enrolled values ("1901EC03","CS100",2020);
SELECT * FROM Enrolled;
-- Find the name of all the courses which start with “CS” code.