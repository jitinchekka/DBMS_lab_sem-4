CREATE DATABASE IIITDM;
USE IIITDM;
CREATE TABLE student(student_id varchar(10), first_name varchar(20), last_name varchar(20), parent_name varchar(20), age int);
CREATE TABLE building(building_name varchar(20), building_id int PRIMARY KEY, capacity_of_student int, no_of_floors int,date_of_inauguration date);
CREATE TABLE faculty(faculty_id varchar(10), fac_name varchar(20), age int, department varchar(10), date_of_joining date);
INSERT INTO student values (0,'f0','l0','p0',11),(1,'f1','l1','p1',17),(2,'f2','l2','p2',24),(3,'f3','l3','p3',10),(4,'f4','l4','p4',19),(5,'f5','l5','p5',14),(6,'f6','l6','p6',28),(7,'f7','l7','p7',28),(8,'f8','l8','p8',12),(9,'f9','l9','p9',14);
INSERT INTO building values('b0',0,51,7,'2022-01-24'),
('b1',1,64,5,'2022-01-24'),
('b2',2,59,9,'2022-01-24'),
('b3',3,68,8,'2022-01-24'),
('b4',4,52,9,'2022-01-24'),
('b5',5,55,5,'2022-01-24'),
('b6',6,51,7,'2022-01-24'),
('b7',7,51,6,'2022-01-24'),
('b8',8,65,7,'2022-01-24'),
('b9',9,57,6,'2022-01-24');

INSERT INTO faculty VALUES(1,"f0",34,"CSE",'2020-1-1'),
(2,"f1",35,"CSE",'2020-1-1'),
(3,"f2",36,"CSE",'2020-1-3'),
(4,"f3",37,"CSE",'2020-1-4'),
(5,"f4",38,"CSE",'2020-2-5'),
(6,"f5",39,"CSE",'2020-3-16'),
(7,"f6",30,"CSE",'2020-3-15'),
(8,"f7",29,"CSE",'2020-4-9'),
(9,"f8",40,"CSE",'2020-4-8'),
(10,"f9",44,"CSE",'2020-5-10');

SELECT * FROM student;
SELECT * FROM faculty;
select * FROM building;

-- 2
INSERT INTO faculty values (11,"f10",34,"CSE",'2020-1-1'),
(12,"f11",35,"ECE",'2021-1-1'),
(13,"f12",36,"ECE",'2021-1-3'),
(14,"f13",37,"ECE",'2021-1-4'),
(15,"f14",38,"ECE",'2021-2-5'),
(16,"f15",39,"ECE",'2021-3-16'),
(17,"f16",30,"ECE",'2021-3-15'),
(18,"f17",29,"ECE",'2021-4-9'),
(19,"f18",40,"ECE",'2021-4-8'),
(20,"f19",44,"ECE",'2021-5-10');

INSERT INTO student values (10,'f10','l10','p10',21),
(11,'f11','l11','p11',21),
(12,'f12','l12','p12',20),
(13,'f13','l13','p13',20),
(14,'f14','l14','p14',21);

INSERT INTO building values('b10',10,51,7,'2022-07-24'),('b11',11,51,7,'2022-07-24'),('b12',12,51,7,'2022-07-24');

SELECT * FROM student;
SELECT * FROM faculty;
select * FROM building;

-- 3
ALTER TABLE student ADD COLUMN department varchar(25);
INSERT INTO student values (15,'f15','l15','p15',22,'CSE'),(16,'f16','l16','p16',22,'CSE'),(17,'f17','l17','p17',22,'MECH'),(18,'f18','l18','p18',22,'MECH'),(19,'f19','l19','p19',22,'MECH');
SELECT * FROM student;
INSERT INTO faculty values (21,"f20",35,"CSE","2022-01-24"),(22,"f22",36,"CSE","2022-01-24"),(22,"f23",35,"CSE","2022-01-24"),(23,"f24",37,"CSE","2022-01-24"),(24,"f25",35,"CSE","2022-01-24"),(25,"f26",37,"CSE","2022-01-24");
INSERT INTO faculty values (26,"f27","38","ECE","2022-01-26"),(27,"f28","38","ECE","2022-01-26"),(28,"f29","39","ECE","2022-01-26"),(29,"f30","39","ECE","2022-01-26");
SELECT * FROM faculty;
SET SQL_SAFE_UPDATES = 0;
UPDATE faculty SET department="MECH" WHERE department="ECE";
SELECT * FROM faculty;

-- 4
INSERT INTO faculty VALUES(21,"f20",54,"ECE",'2020-7-1'),
(22,"f21",35,"ECE",'2021-7-1'),
(23,"f22",34,"ECE",'2021-7-3'),
(24,"f23",37,"ECE",'2021-7-4'),
(25,"f24",48,"ECE",'2021-7-10');

select * FROM faculty;

SELECT * FROM student;
SET SQL_SAFE_UPDATES = 0;
update student SET department="Math" WHERE student_id=0;
update student SET department="Math" WHERE student_id=1;
update student SET department="Physics" WHERE student_id=2;
delete from student where department = "Math";
delete from student where department = "Physics";

delete from building where building_id = 0;
select* from building; 

-- IV

alter table Student add column percent int;
insert into Student values (20, "f20","l20","p20",19,100),
	   (21, "f21","l21","p21",18,100),
       (22,  "f22","l22","p22",18,100),
       (23,  "f23","l23","p23",19,100),
       (24,  "f24","l24","p24",19,100),
       (25,  "f25","l25","p25",18,100),
       (26,  "f26","l26","p26",18,100),
       (27, "f27","l27","p27",19,100),
       (28,  "f28","l28","p28",17,100),
       (29,  "f29","l29","p29",17,100);
select* from student;

alter table building drop column Date_of_inauguration;

alter table building add column staff_id varchar(10);

select* from building;