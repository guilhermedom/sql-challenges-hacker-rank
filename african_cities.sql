/* Problem: Given the CITY and COUNTRY tables, query the names of all
cities where the CONTINENT is 'Africa'.

Note: CITY.CountryCode and COUNTRY.Code are matching key columns. */

SELECT CI.NAME
FROM   city CI
       INNER JOIN country CO
               ON CI.countrycode = CO.code
WHERE  continent = 'Africa';
