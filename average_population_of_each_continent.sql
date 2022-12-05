/* Problem: Given the CITY and COUNTRY tables, query the names of all
the continents (COUNTRY.Continent) and their respective average city
populations (CITY.Population) rounded down to the nearest integer. */

SELECT CO.continent,
       Floor(Avg(CI.population))
FROM   city CI
       INNER JOIN country CO
               ON CI.countrycode = CO.code
GROUP  BY CO.continent;
