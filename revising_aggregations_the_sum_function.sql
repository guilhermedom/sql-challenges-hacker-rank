/* Problem: Query the total population of all cities in CITY where
District is California. */

SELECT Sum(population)
FROM   city
WHERE  district = 'California';
