/* Problem: Given the CITY and COUNTRY tables, query the sum of the
populations of all cities where the CONTINENT is 'Asia'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns. */

SELECT Sum(CI.population)
FROM   city CI
       INNER JOIN country CO
               ON CI.countrycode = CO.code
WHERE  continent = 'Asia';
