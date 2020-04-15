.read data.sql

-- QUESTIONS --



-------------------------------------------------------------------------
------------------------ Give Interest- ---------------------------------
-------------------------------------------------------------------------

UPDATE accounts SET amount = amount * 1.02;


create table give_interest_result as select * from accounts; -- just for tests

-------------------------------------------------------------------------
------------------------ Split Accounts ---------------------------------
-------------------------------------------------------------------------

CREATE TABLE temp AS 
  SELECT name || "'s Checking account" AS name, amount/2 AS amount FROM accounts;
UPDATE accounts SET name = name || "'s Savings account", amount = amount/2;
INSERT INTO accounts SELECT * FROM temp; 

create table split_account_results as select * from accounts; -- just for tests

-------------------------------------------------------------------------
-------------------------------- Whoops ---------------------------------
-------------------------------------------------------------------------

DROP TABLE IF EXISTS accounts;


CREATE TABLE average_prices AS
  SELECT category AS category, avg(MSRP) AS average_price FROM products GROUP BY category;

CREATE TABLE lowest_prices AS
  SELECT store AS store, item AS item, min(price) AS price FROM inventory GROUP BY item;

CREATE TABLE shopping_list AS
  SELECT name AS name, store AS place FROM products, lowest_prices WHERE name = item GROUP BY category HAVING min(MSRP/rating);

CREATE TABLE total_bandwidth AS
  SELECT sum(Mbs) FROM shopping_list, stores WHERE place = store;
