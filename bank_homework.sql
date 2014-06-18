-- In case there is already a bank_homework database, drop it
DROP DATABASE IF EXISTS bank_homework;

-- Create a bank_homework database
CREATE DATABASE bank_homework;

-- Connect to the bank_homework databases
\c bank_homework

-- Create a payments table
--  The table should have columns of id, created_at, amount, payer_name,
--  recipient_name, and description with the appropriate datatypes
CREATE TABLE payments (
  id SERIAL PRIMARY KEY,
  created_at DATE,
  amount NUMERIC,
  payer_name TEXT,
  recipient_name TEXT,
  description TEXT
);

-- Alter the payments table, add the column of `zipcode`
-- to specify where the transaction was made
ALTER TABLE payments ADD zipcode INTEGER;

-- Insert 20 rows into the payments table
-- The first of these payments should be deposits
-- try to keep the accounts positive and have at least three different payers.
INSERT INTO payments (created_at, amount, payer_name, recipient_name, description, zipcode) VALUES
  ('2014-05-15', 40.00, 'Bob', 'Jane', 'Internet bill', 22314),
  ('2014-03-15', 5.00, 'Bob', 'Eliza', 'Milk', 22314),
  ('2014-06-15', 15.00, 'Bob', 'Eliza', 'Burgers', 22314),
  ('2014-02-15', 35.00, 'Murray', 'Eliza', 'Internet bill', 22314),
  ('2014-01-15', 4.50, 'Murray', 'Eliza', 'Dowry', 22314),
  ('2014-01-15', 1.00, 'Murray', 'Bob', 'Sorry about your face', 22314),
  ('2014-04-15', 40.00, 'Murray', 'Jane', 'Internet bill', 22314),
  ('2014-05-15', 6000.00, 'Bob', 'Jane', 'Six unicorns', 22101),
  ('2013-12-15', 23.45, 'Bob', 'Murray', 'Lost a bet', 22101),
  ('2013-11-25', 400.00, 'Bob', 'Jane', 'Drug dealing', 22314),
  ('2014-05-18', 40.00, 'Bella', 'Jim', 'Electric bill', 22314),
  ('2014-03-18', 5.00, 'Bella', 'Eliza', 'Sorry for farting', 22314),
  ('2014-06-18', 18.00, 'Bella', 'Eliza', 'BEER', 22314),
  ('2014-02-18', 35.00, 'Murray', 'Eliza', 'Internet bill', 22314),
  ('2014-01-18', 4.50, 'Murray', 'Eliza', 'In case of emergency', 22314),
  ('2014-01-18', 1.00, 'Murray', 'Bella', 'A present', 22314),
  ('2014-04-18', 40.00, 'Eliza', 'Jane', 'Internet bill', 22314),
  ('2014-05-18', 6000.00, 'Bella', 'Jim', 'An old car', 22314),
  ('2014-05-18', 23.45, 'Bella', 'Murray', 'Bought your liver online', 22314),
  ('2014-05-18', 400.00, 'Bella', 'Jane', 'Vampire blood', 20904);

-- You receive notice that the payment with id of 9 is $10 too low.
-- Alter that row so that it is corrected
UPDATE payments SET amount = amount + 10 WHERE id = 9;

-- Delete all payments with an amount under $2
DELETE FROM payments WHERE amount < 2;

-- Select all entries from the payments table
SELECT * FROM payments;

-- In a single query, output all payments ordered from the largest to the smallest
SELECT * FROM payments ORDER BY amount DESC;

-- In a single query, output the names of all distinct recipients
SELECT DISTINCT recipient_name FROM payments;

-- In a single query, select all payments created in the past week


-- In a single query, select all payments with a blank description


-- In a single query, select all payments matching the name of one of the payers (choose any single one)
