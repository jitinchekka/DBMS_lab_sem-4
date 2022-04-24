CREATE DATABASE q3;
CREATE TABLE employees(employee_id int NOT NULL PRIMARY KEY, first_name VARCHAR(10), last_name varchar(10), email varchar(30) UNIQUE,phone_number int(10) UNIQUE, hire_date date, job_id varchar(5),salary int, manager_id int,deptartment_id int);
SELECT * FROM employees;
INSERT INTO employees VALUES(700,'Hasmukh','Patel','hp@gmail.com',700326160,'2020-08-15','Hp003',7000,null,90);
INSERT INTO employees VALUES(800,'Kamlesh','Paul','kp@gmail.com',null,'2020-02-17','kp004',8000,506,90),(900,'Dinesh','Gandhi','dp@yahoo',null,'2101-03-19','Dg006',20000,508,80);
ALTER TABLE employees MODIFY COLUMN phone_number bigint;
UPDATE employees SET phone_number=7003216170 WHERE employee_id=800;	
UPDATE employees SET phone_number=9136278563 WHERE employee_id=800;	
INSERT INTO employees VALUES(701,'Suresh','Modi','sm@gmail.com',9187653294,'2015-04-20','Sm009',15000,null,80);
SELECT employee_id,manager_id,first_name,last_name from employees;