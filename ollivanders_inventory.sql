/* Problem: Harry Potter and his friends are at Ollivander's with Ron,
finally replacing Charlie's old broken wand.

Hermione decides the best way to choose is by determining the minimum
number of gold galleons needed to buy each non-evil wand of high power
and age. Write a query to print the id, age, coins_needed, and power of
the wands that Ron's interested in, sorted in order of descending power.
If more than one wand has same power, sort the result in order of
descending age. */

WITH cheap_wands
     AS (SELECT code,
                age,
                Min(coins_needed) AS coins_needed
         FROM   wands
                NATURAL JOIN wands_property
         WHERE  is_evil = 0
         GROUP  BY code,
                   age,
                   power)
SELECT id,
       age,
       coins_needed,
       power
FROM   wands
       NATURAL JOIN cheap_wands
ORDER  BY power DESC,
          age DESC;
