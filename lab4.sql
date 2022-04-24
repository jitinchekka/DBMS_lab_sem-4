-- Jitin CS20B1075
-- Lab-4 DBMS Lab
CREATE DATABASE lab4;
-- Question 1
USE lab4;
CREATE Table STUDENTACCOUNT(id int PRIMARY KEY AUTO_INCREMENT,Person_Name VARCHAR(15),Department VARCHAR(2),Birth DATE);
-- a. Write a mysql to determine the age in years and month of each of the person_Name working in department CS.
insert into STUDENTACCOUNT(id, Person_Name, Department, Birth)
values (1, "Ramesh", "CS", '2001-01-12'),
	   (2, "suresh", "IT", '2020-02-20'),
       (3, "Jomin", "CS", '1996-02-29'),
       (4, "Shree", "IT", '2012-12-18'),
       (5, "Hemanth", "CS", '2022-02-07');
SELECT * FROM STUDENTACCOUNT;
-- a. Write a mysql to determine the age in years and month of each of the person_Name working in department CS.
SELECT Person_Name ,CONCAT(FLOOR((TIMESTAMPDIFF(MONTH, Birth, CURDATE()) / 12)), ' YEARS ',MOD(TIMESTAMPDIFF(MONTH, Birth, CURDATE()), 12) , ' MONTHS') AS Age FROM STUDENTACCOUNT;

-- b. Write a mysql to retrieve name having alphabet 'S'.
SELECT * FROM STUDENTACCOUNT WHERE Person_Name LIKE '%S%';

-- c.Write a mysql statement to get name of students containing exactly five characters.
SELECT * FROM STUDENTACCOUNT where Person_Name REGEXP '^.....$'; -- ^ = start of string, $ = end of string, . = any character

-- d.Display the alternate rows from table.
SELECT * FROM STUDENTACCOUNT WHERE id % 2 = 1;
SELECT * FROM STUDENTACCOUNT WHERE id % 2 = 0;
-- Question 2

CREATE Table Employees(Employee_id int PRIMARY KEY AUTO_INCREMENT,First_name VARCHAR(15),Last_name VARCHAR(15),Salary BIGINT,Joining_date DATE,Department VARCHAR(10));
insert into Employees (Employee_id ,  First_Name , Last_Name , salary , Joining_date , Department) values (1 , "Boby" , "Rathod" , 1000000 , '2020-12-20' , "Finance");
insert into Employees (Employee_id ,  First_Name , Last_Name , salary , Joining_date , Department) values (2 , "Jasmin" , "Jose" , 6000000 , "2015-02-07" , "IT");
insert into Employees (Employee_id ,  First_Name , Last_Name , salary , Joining_date , Department) values (3 , "Pratap" , "Mathew" , 8900000 , "2014-03-09" , "Banking");
insert into Employees (Employee_id ,  First_Name , Last_Name , salary , Joining_date , Department) values (4 , "John" , "Michel" , 2000000 , "1994-03-17" , "Insurance");
insert into Employees (Employee_id ,  First_Name , Last_Name , salary , Joining_date , Department) values (5 , "Alex" , "Kinto" , 2200000 , "1987-02-25" , "Finance");
insert into Employees (Employee_id ,  First_Name , Last_Name , salary , Joining_date , Department) values (6 , "Jaswanth" , "Kumar" , 1230000 , '2021-07-23' , "IT");

SELECT * FROM Employees;

-- a.Get all the details about employees with a salary between 2,000,000 and 5,000,000.
SELECT * FROM Employees WHERE salary BETWEEN 2000000 AND 5000000;

-- b. Get the Last_name about employees with work experience more than three years whose first_name contain the alphabet ‘a’.
SELECT Last_Name FROM Employees WHERE TIMESTAMPDIFF(YEAR, Joining_date, CURDATE()) > 3 AND First_Name LIKE '%a%';

-- c. Display the joining_date of employees working in IT department having salary more than average salary of company.
-- Without subquery

select avg(Salary)< Salary, Joining_date from employees where Department = 'IT';
-- d. Find the details of employees working in Finance department having salary less than average salary of IT department.
-- without using subquery
SELECT AVG(Salary) FROM Employees WHERE Department = 'IT';
SELECT * FROM Employees WHERE Department = 'Finance' AND Salary<3615000.0000;