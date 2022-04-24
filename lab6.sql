-- DBMS Lab-6
-- Author: Jitin (CS20B1075)
--  Consider a Table name IIITDM(Faculty name, Student_Id, Building
-- name),Faculty(Faculty_id,Faculty_name,department,Subject),Student(Student_Id,
-- Student_name, department, course, Building_name), Building(Building_name,
-- Room_no,Floor), Course(department, subject, course_id).

-- Assuming that course is same as subject.
CREATE DATABASE lab6
    DEFAULT CHARACTER SET = 'utf8mb4';
USE lab6;
CREATE TABLE IIIDM(Faculty_name VARCHAR(35), Student_id INT, Building_name VARCHAR(35));
CREATE TABLE Faculty(faculty_id INT PRIMARY KEY, faculty_name VARCHAR(35), department VARCHAR(35), subject VARCHAR(35));
CREATE TABLE Student(student_id INT PRIMARY KEY, student_name VARCHAR(35), department VARCHAR(35), course VARCHAR(35), building_name VARCHAR(35));
CREATE TABLE Building(building_name VARCHAR(35) PRIMARY KEY, room_no INT, floor INT);
CREATE TABLE Course(department VARCHAR(35), subject VARCHAR(35), course_id INT PRIMARY KEY);

INSERT into iiidm VALUES('Jagadeesh',4,'Jasmine'),('Suresh',1,'Ashwatha'),('Karthik',3,'Banyan'),(5,NULL,NULL);
insert into Faculty(Faculty_id,Faculty_name,department,Subject) values
(1,'Jagadeesh','CSE','DBMS'),
(2,'Suresh','CSE','Algorithms'),
(3,'Karthik','CSE','DataStructure'),
(4,'Joseph','CSE','TOC'),
(5,'rajesh','CSE','OOPS');

insert into Student(Student_id,Student_name,department,Course,Building_name) values
(1,'Anup','CSE','Algorithms','Ashwatha'),
(2,'Ramesh','CSE','ToC','Ashoka'),
(3,'Paul','CSE','DataStructure','Banyan'),
(4,'Adam','CSE','DBMS','Jasmine'),
(5,'Krishna','CSE','Algorithms','Rose');

insert into Building(Building_name,Room_no,Floor) values
('Ashoka',140,4),
('Ashwatha',120,3),
('Rose',30,1),
('Jasmine',30,2),
('Banyan',40,3);


insert into Course(department,Subject,Course_id) values
('CSE','Algorithms',101),
('CSE','ToC',202),
('CSE','DataStructure',102),
('CSE','DBMS',201),
('CSE','OOPS',203);

-- Using Joins
-- Find the student_id who is learning course from a particular faculty and living in room no. 30 
select student.student_id from student inner join  Building  using(Building_name) inner join IIIDM using(student_id) where Room_no = 30 and Faculty_name='Jagadeesh';
-- Find the course of a student living in room no 140 in a given building 
SELECT course FROM Student INNER JOIN Building ON Student.building_name = Building.building_name WHERE Building.room_no = 140 AND Building.building_name = 'Ashoka';
-- Find faculty who is not teaching subject to a particular student 
SELECT faculty_name FROM Faculty WHERE Faculty.subject NOT IN (SELECT course FROM Student WHERE student_name = 'Ramesh');
-- Find the course taught by the faculty to the student lives in third floor of a particular building
SELECT course FROM STUDENT INNER JOIN Building USING (building_name) INNER JOIN faculty ON (faculty.department=student.department AND faculty.subject=student.course) WHERE Building.floor = 3 AND building_name='Ashwatha';
