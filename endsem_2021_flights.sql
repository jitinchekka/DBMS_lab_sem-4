-- Flights(flno: integer, src: string, dest: string, distance: integer, Departs:time, arrives:time, price:integer)
-- Aircraft(VALUES aid: integer, aname: string, cruisingrange: integer)
-- Certified(VALUES eid: integer, aid: integer)
-- Employees(VALUES eid: integer, ename: string, salary: integer)
CREATE DATABASE Flight;
USE FLIGHT;
CREATE Table flights(
  flno int PRIMARY KEY,
  src VARCHAR(255),
  dest VARCHAR(255),
  distance int,
  Departs time,
  arrives time,
  price int
);
CREATE Table aircraft(
  aid int PRIMARY KEY,
  aname VARCHAR(255),
  cruisingrange int
);
CREATE Table certified(eid int, aid int, PRIMARY KEY(eid, aid));
CREATE Table employees(
  eid int PRIMARY KEY,
  ename VARCHAR(255),
  salary int
);
INSERT INTO flights VALUES(1,'hyd','maa',1000,time('10:00:00'),time('12:00:00'),3000);
INSERT INTO flights VALUES(2,'hyd','blr',1000,time('11:00:00'),time('13:00:00'),4500);
INSERT INTO flights VALUES(3,'hyd','del',1000,time('12:00:00'),time('14:00:00'),5000);
INSERT INTO flights VALUES(4,'hyd','mum',1000,time('13:00:00'),time('15:00:00'),6000);
INSERT INTO flights VALUES(5,'hyd','ccu',1000,time('14:00:00'),time('16:00:00'),7000);
INSERT INTO flights VALUES(6,'maa','dub',1000,time('14:00:00'),time('16:00:00'),4000);
INSERT INTO flights VALUES(7,'dub','maa',1000,time('14:00:00'),time('16:00:00'),3000);
INSERT INTO aircraft VALUES(1,'Airbus 100',25000);
INSERT INTO aircraft VALUES(2,'Boeing 100',2000);
INSERT INTO aircraft VALUES(3,'Airbus 200',3000);
INSERT INTO aircraft VALUES(4,'Boeing 200',4000);
INSERT INTO aircraft VALUES(5,'Boeing 300',4000);
INSERT INTO aircraft VALUES(6,'Boeing 300',4000);
INSERT INTO certified VALUES(1,1);
INSERT INTO certified VALUES(1,2);
INSERT INTO certified VALUES(2,3);
INSERT INTO certified VALUES(2,4);
INSERT INTO certified VALUES(3,2);
INSERT INTO certified VALUES(3,3);
INSERT INTO certified VALUES(4,3);
INSERT INTO certified VALUES(4,1);
INSERT INTO certified VALUES(5,1);
INSERT INTO certified VALUES(6,1);
INSERT INTO certified VALUES(5,2);
INSERT INTO certified VALUES(6,3);

INSERT INTO employees VALUES(1,'Ramesh',10000);
INSERT INTO employees VALUES(2,'Dinesh',20000);
INSERT INTO employees VALUES(3,'Robert',30000);
INSERT INTO employees VALUES(4,'Karthik',40000);
INSERT INTO employees VALUES(4,'Surya',40000);
INSERT INTO employees VALUES(5,'Mahi',40000);
INSERT INTO employees VALUES(6,'Ram',40000);

-- Print the names of employees who are certified only on aircrafts with cruisingrange longer than 1000 miles and who are certified on some Boeing aircraft.
 SELECT E.ename
      FROM Employees E, Certified C, aircraft A
      WHERE C.aid = A.aid AND E.eid = C.eid
      GROUP BY E.eid, E.ename
      HAVING aircraft.cruisingrange > 1000;
SELECT
  ename
FROM
  employees
  INNER JOIN certified  ON employees.eid = certified.eid
  INNER JOIN aircraft ON aircraft.aid = certified.aid
WHERE
  aircraft.cruisingrange > 1000
  AND aname LIKE 'Boeing%';

-- Find the total amount paid to pilots who drove greater than 500,000 miles together across all their journey on the routes from Chennai to Dublin and return route also.
SELECT SUM (E.salary) FROM employees E INNER JOIN certified C on certified.eid=employees.eid INNER JOIN flights F ON F.flno=C.aid WHERE SUM(F.distance)>500000 AND ((F.src="maa" AND F.dest="dub") OR (F.src="dub" AND F.dest="maa"));
-- 6. Find the names of pilots who can operate planes with a range greater than 3,000 miles but are not certified on any Boeing aircraft.
SELECT E.ename FROM aircraft A INNER JOIN certified C ON C.aid=A.aid INNER JOIN employees E ON C.eid=E.eid WHERE A.cruisingrange>3000 AND E.eid NOT IN(SELECT C.eid FROM certified C,Aircraft A WHERE A.aid=C.aid AND aname LIKE "Boeing%");
UPDATE employees SET salary=150000 WHERE eid=1;
UPDATE employees SET salary=300000 WHERE eid=2;
-- 5. Identify the flights that can be piloted by every pilot whose salary is more than $100,000.
SELECT aname FROM aircraft A INNER JOIN certified C ON A.aid=C.aid INNER JOIN employees E ON E.eid=C.eid WHERE salary>100000;
-- 3. Find the names of pilots certified for some Boeing aircraft.
SELECT ename FROM employees WHERE eid IN (SELECT C.eid FROM certified C INNER JOIN aircraft A ON C.aid=A.aid INNER JOIN employees E ON c.eid=E.eid WHERE A.aname LIKE "Boeing%");
-- 4.Find the aids of all aircraft that can be used on non-stop flights from Kolkata to Madras.
SELECT flno FROM flights WHERE src="ccu" AND dest="maa";