/* Problem: Harry Potter and his friends are at Ollivander's with Ron,
finally replacing Charlie's old broken wand.

Hermione decides the best way to choose is by determining the minimum
number of gold galleons needed to buy each non-evil wand of high power
and age. Write a query to print the id, age, coins_needed, and power of
the wands that Ron's interested in, sorted in order of descending power.
If more than one wand has same power, sort the result in order of
descending age. */

-- "code" and "age" have a 1 to 1 relationship. Because of this, we can
-- group by both of them at the same time as needed. We select "code" in
-- the first query so that we can perform a NATURAL JOIN in the second
-- query.
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
-- Since we have already aggregated the min coins needed for each wand,
-- in the second query we join again to get the id for each wand and
-- order the result as requested. Note that there are no duplicate wands
-- with same age and power.
SELECT id,
       age,
       coins_needed,
       power
FROM   wands
       NATURAL JOIN cheap_wands
ORDER  BY power DESC,
          age DESC;
