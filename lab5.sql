-- Author: Jitin Roll Number: CS20B1075
-- Q 1
-- Consider the following table Agent(AGENT_CODE, AGENT_NAME, WORKING_AREA,|COMMISSION , PHONE_NO, COUNTRY ) and Orders(ORD_NUM, ORD_AMOUNT,ADVANCE_AMOUNT, ORD_DATE,CUST_CODE,AGENT_CODE,ORD_DESCRIPTION )
CREATE TABLE Agent(
  AGENT_CODE VARCHAR(5) PRIMARY KEY,
  AGENT_NAME VARCHAR(20),
  WORKING_AREA VARCHAR(20),
  COMMISSION DECIMAL(10, 2),
  PHONE_NO VARCHAR(20),
  COUNTRY VARCHAR(20)
);
CREATE TABLE Orders(
  ORD_NUM INT PRIMARY KEY,
  ORD_AMOUNT BIGINT,
  ADVANCE_AMOUNT BIGINT,
  ORD_DATE DATE,
  CUST_CODE VARCHAR(5),
  AGENT_CODE VARCHAR(5),
  ORD_DESCRIPTION VARCHAR(35)
);
INSERT INTO
  Agent
VALUES(
    'Ac001',
    'Ramesh',
    'Bangalore',
    0.15,
    '0331234567',
    'India'
  ),(
    'Ac002',
    'Dinesh',
    'Bangalore',
    0.25,
    '0331234568',
    NULL
  ),(
    'Ac003',
    'Suresh',
    'Mumbai',
    0.35,
    '0541234569',
    'London'
  ),(
    'Ac004',
    'Kamlesh',
    'New Jersey',
    0.68,
    '0331234564',
    NULL
  ),(
    'Ac005',
    'Karthik',
    'Chennai',
    0.73,
    '0331234563',
    'India'
  );
INSERT INTO
  orders
VALUES(
    004,
    200,
    3000,
    '2020-07-15',
    'C004',
    'Ac001',
    'Masala Kulcha'
  ),(
    007,
    600,
    5000,
    '2020-08-17',
    'C006',
    'Ac003',
    'Biriyani'
  ),(
    008,
    700,
    100,
    '2019-02-19',
    'C007',
    'Ac005',
    NULL
  ),(
    009,
    10000,
    600,
    '2010-03-21',
    'C009',
    'Ac008',
    'Masala Dosa'
  ),(
    010,
    20,
    600,
    '2012-04-21',
    'C006',
    'Ac005',
    NULL
  );
--   a. Find ord_num, ord_amount, ord_date, cust_code and agent_code from the table Orders working_area of Agent table must be Bangalore.
SELECT
  ORD_NUM,
  ORD_AMOUNT,
  ORD_DATE,
  CUST_CODE,
  AGENT_CODE
FROM
  Orders
WHERE
  AGENT_CODE IN (
    SELECT
      AGENT_CODE
    FROM
      Agent
    WHERE
      WORKING_AREA = 'Bangalore'
  );
--b.  Retrive ord_num, ord_amount, cust_code and agent_code from the table orders where the agent_code of orders table must be the same agent_code of agents table and agent_name of agents table must be Ramesh.
SELECT
  ORD_NUM,
  ORD_AMOUNT,
  CUST_CODE,
  AGENT_CODE
FROM
  Orders
WHERE
  AGENT_CODE IN (
    SELECT
      AGENT_CODE
    FROM
      Agent
    WHERE
      AGENT_NAME = 'Ramesh'
  );
-- Q2
  -- Consider the tables salesman(salesman_id, name ,city ,commission ) and Orders(ord_no, purch_amt, ord_date, customer_id, salesman_id )
  CREATE TABLE salesman(
    salesman_id VARCHAR(8) PRIMARY KEY,
    name VARCHAR(20),
    city VARCHAR(20),
    commission DECIMAL(10, 2)
  );
CREATE TABLE orders2(
    ord_no INT PRIMARY KEY,
    purch_amt BIGINT,
    ord_date DATE,
    customer_id VARCHAR(5),
    salesman_id VARCHAR(8)
  );
INSERT INTO
  salesman
VALUES
  ('si123@06', 'Lakshmi', 'Kolkata', 0.5),
  ('si123@09', 'Ganesh', 'London', 0.6),
  ('si123@90', 'Dinesh', 'London', 0.3),
  ('si123@10', 'Joseph', 'Chennai', 0.6),
  ('si123@19', 'Mahesh', 'Hyderabad', 0.65),
  ('si123@26', 'Paul Adam', 'London', 0.1),
  ('si123@67', 'Rahul', 'Delhi', 0.4);
INSERT INTO
  orders2
VALUES
  (123, 600, '2010-08-20', '003cd', 'si123@19'),
  (576, 750, '2018-02-20', '004cd', 'si123@19'),
  (579, 800, '2012-05-20', '004cd', 'si123@26'),
  (600, 60000, '2021-01-20', '006cd', 'si123@10'),
  (700, 745, '2021-01-26', '007cd', 'si123@09'),
  (800, 860, '2019-01-29', '007cd', 'si123@26');
-- a. Display all the orders from the orders2 table issued by the salesman 'Paul Adam'.
SELECT
  ord_no,
  purch_amt,
  ord_date,
  customer_id,
  salesman_id
FROM
  orders2
WHERE
  salesman_id = (
    SELECT
      salesman_id
    FROM
      salesman
    WHERE
      name = 'Paul Adam'
  );
-- b. Display all the orders for the salesman who belongs to the city London
SELECT
  ord_no,
  purch_amt,
  ord_date,
  customer_id,
  salesman_id
FROM
  orders2
WHERE
  salesman_id IN (
    SELECT
      salesman_id
    FROM
      salesman
    WHERE
      city = 'London'
  );
