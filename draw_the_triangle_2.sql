/* Problem: P(R) represents a pattern drawn by Julia in R rows. The
following pattern represents P(5):

* 
* * 
* * * 
* * * * 
* * * * *

Write a query to print the pattern P(20). */

-- Initialize variable to 0 so that it starts at 1 in the loop.
SET @stars = 0;

-- Until stars reaches 20, the '* ' will be repeatedly inserted multiple
-- times in the result. Use information_schema as there are no tables
-- for this challenge but most DBMS ask for a table to query from.
SELECT REPEAT('* ', @stars := @stars + 1)
FROM   information_schema.tables
LIMIT  20;
