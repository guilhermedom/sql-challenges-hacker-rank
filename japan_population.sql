/* Problem: Query the sum of the populations for all Japanese cities in
CITY. The COUNTRYCODE for Japan is JPN. */

SELECT Sum(population)
FROM   city
WHERE  countrycode = 'JPN';
