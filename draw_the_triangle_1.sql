/* Problem: P(R) represents a pattern drawn by Julia in R rows. The
following pattern represents P(5):

* * * * * 
* * * * 
* * * 
* * 
*

Write a query to print the pattern P(20). */

-- Initialize variable to 21 so that it starts at 20 in the loop.
SET @stars = 21;

-- Until stars reaches 0, the '* ' will be repeatedly inserted multiple
-- times in the result. Use information_schema as there are no tables
-- for this challenge but most DBMS ask for a table to query from.
SELECT REPEAT('* ', @stars := @stars - 1)
FROM   information_schema.tables;
