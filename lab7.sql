CREATE DATABASE lab7 DEFAULT CHARACTER SET = 'utf8mb4';
USE lab7;
CREATE TABLE Bank(Bank_name VARCHAR(10), State VARCHAR(30));
INSERT INTO
  Bank
VALUES('SBI', 'Andhra Pradesh'),('SBI', 'Tamil Nadu'),('SBI', 'Karnataka'),('ICICI', 'Tamil Nadu'),('ICICI', 'Karnataka');
CREATE TABLE Account_holder(
    account_name VARCHAR(20),
    Bank_name VARCHAR(10),
    State VARCHAR(30)
  );
INSERT INTO
  Account_holder
VALUES('Ramesh', 'ICICI', 'Tamil Nadu'),('Dinesh', 'SBI', 'Andhra Pradesh'),('Robert', 'SBI', 'Tamil Nadu'),('Robert', 'ICICI', 'Karnataka'),('Robert', 'SBI', 'Andhra Pradesh'),('Karthik', 'SBI', 'Andhra Pradesh');
--      1. Find the Account_name having account in all banks.
-- Step 1
CREATE TABLE allAccounts as select distinct Account_name FROM Account_holder;
SELECT * FROM allaccounts;
CREATE Table allBanks as select distinct Bank_name from Bank; 
-- Step 2 cartesian product
CREATE table AccountsAndBanks AS
SELECT allAccounts.Account_name, allBanks.Bank_name
FROM AllAccounts, allBanks;
SELECT * FROM accountsandbanks;
-- Step 3
CREATE table holdersWithoutAccounts AS
SELECT * FROM AccountsAndBanks WHERE NOT EXISTS
(Select Account_name,Bank_name FROM Account_holder WHERE AccountsAndBanks.Account_name =
Account_holder.Account_name
AND AccountsAndBanks.Bank_name = Account_holder.Bank_name);
-- Step 4
CREATE table notHavingAllAccounts AS SELECT DISTINCT Account_name FROM
holdersWithoutAccounts;
SELECT * FROM nothavingallaccounts;
-- Step 5
CREATE Table haveAllAccounts AS SELECT * FROM
allAccounts
WHERE NOT EXISTS
(SELECT * FROM nothavingallaccounts WHERE
nothavingallaccounts.account_name =
allAccounts.account_name);
SELECT * FROM haveAllAccounts;

--    2. Find the bank available in all state.
-- CREATE Table allBanks as SELECT DISTINCT Bank_name FROM Bank;
CREATE Table allStates as SELECT DISTINCT state FROM Bank; 
CREATE table banksAndStates AS
SELECT allBanks.Bank_name, allStates.State
FROM allBanks, allStates;
SELECT * FROM banksandstates;
CREATE table BanksNotInStates AS
SELECT * FROM banksAndStates WHERE NOT EXISTS
(Select * FROM Bank WHERE banksAndStates.Bank_name =
Bank.Bank_name
AND banksAndStates.State = Bank.State);
SELECT * FROM BanksNotInStates;
CREATE table NotBanks AS SELECT DISTINCT Bank_name FROM
BanksNotInStates;
CREATE Table BanksInAllStates AS SELECT * FROM
AllBanks
WHERE NOT EXISTS
(SELECT * FROM NotBanks WHERE
NotBanks.Bank_name =
AllBanks.Bank_name);
SELECT * FROM banksinallstates;
-- 3. Find the bank not available in all the states
SELECT bank_name FROM banksnotinstates;

-- 4. Find the account_name having account in all the states
CREATE table AccountsAndStates AS
SELECT allAccounts.Account_name, allStates.State
FROM AllAccounts, allStates;
SELECT * FROM accountsandstates;
CREATE table AccountsWithoutStates AS
SELECT * FROM AccountsAndStates WHERE NOT EXISTS
(Select Account_name,state FROM Account_holder WHERE AccountsAndStates.Account_name =
Account_holder.Account_name
AND AccountsAndStates.state = Account_holder.state);

CREATE table notInAllStates AS SELECT DISTINCT Account_name FROM
AccountsWithoutStates;
SELECT * FROM notinallstates;
CREATE Table AccountsInAllStates AS SELECT * FROM
AllAccounts
WHERE NOT EXISTS
(SELECT * FROM notinallstates WHERE
notinallstates.account_name =
AllAccounts.Account_name);
SELECT * FROM accountsinallstates;