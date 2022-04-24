-- 1B Q1
CREATE DATABASE q2;
SHOW DATABASES;
USE q2;
CREATE TABLE agentagent(order_num int,order_amount int, advance_amount int, order_date date,cust_code varchar(4),agent_code varchar(5),description varchar(30));
INSERT INTO agent VALUES(004,200,3000,'2020-08-15','C004','Ac001','Masala kulcha');
DESCRIBE agent;
select * FROM agent ;
-- ALTER TABLE agent DROP PRIMARY KEY;
INSERT INTO agent VALUES(007,600,5000,'2020-09-17','C006','Ac003','Biriyani'),(008,700,100,'2019-02-19','C007','Ac005','Biriyani'),(009,10000,600,'2010-03-21','C009','Ac002','Masala dosa'),(010,20,600,'2012-04-21','C006','Ac005','Chicken tikka');
select * FROM agent ;
ALTER TABLE agent RENAME TO orders;
SELECT * FROM orders;
ALTER table orders ADD PRIMARY KEY(order_num);
-- 1B Q2
CREATE TABLE agent(agent_code varchar(5) NOT NULL PRIMARY KEY, agent_name VARCHAR(15), working_area varchar(30), commision DECIMAL(2,2), phone_no INT UNIQUE, country varchar(10));
insert INTO agent VALUES('Ac001','Ramesh','Bangalore',.15,0331234567,'India');
insert INTO agent(agent_code,agent_name,working_area,commision,phone_no) VALUES('Ac002','Dinesh','Bangalore',.25,0331234568);
insert INTO agent VALUES('Ac003','Suresh','Mumbai',.35,0331234569,'London');
insert INTO agent(agent_code,agent_name,working_area,commision,phone_no) VALUES('Ac002','Dinesh','Bangalore',.25,0331234568);
insert INTO agent(agent_code,agent_name,working_area,commision,phone_no) VALUES('Ac004','Kamlesh','New Jersey',.68,0331234564);
insert INTO agent VALUES('Ac005','Karthik','Chennai',.73,0331234563,'India');
SELECT * FROM AGENT;