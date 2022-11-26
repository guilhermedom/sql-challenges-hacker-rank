/* Problem: Query the two cities in STATION with the shortest and
longest CITY names, as well as their respective lengths (i.e.: number of
characters in the name). If there is more than one smallest or largest
city, choose the one that comes first when ordered alphabetically. */

SELECT city,
       Min(Length(city))
FROM   station
GROUP  BY city
ORDER  BY Min(Length(city)),
          city
LIMIT  1;

SELECT city,
       Min(Length(city))
FROM   station
GROUP  BY city
ORDER  BY Min(Length(city)) DESC,
          city
LIMIT  1;
