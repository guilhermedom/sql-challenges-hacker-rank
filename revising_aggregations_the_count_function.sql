/* Problem: Query a count of the number of cities in CITY having a
Population larger than 100,000. */

SELECT Count(*)
FROM   city
WHERE  population > 100000;
