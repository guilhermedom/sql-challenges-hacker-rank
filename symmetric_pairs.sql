/* Problem: You are given a table, Functions, containing two columns: X
and Y.

Two pairs (X1, Y1) and (X2, Y2) are said to be symmetric pairs if
X1 = Y2 and X2 = Y1.

Write a query to output all such symmetric pairs in ascending order by
the value of X. List the rows such that X1 ≤ Y1. */

SELECT x1,
       y1
FROM   ((SELECT F.x AS X1,
                F.y AS Y1
         FROM   functions F
                INNER JOIN functions F2
                        ON F.x = F2.y
                           AND F2.x = F.y
                           AND F.x <> F.y)
        UNION
        (SELECT F.x AS X1,
                F.y AS Y1
         FROM   functions F
                INNER JOIN functions F2
                        ON F.x = F2.y
                           AND F2.x = F.y
                           AND F.x = F.y
         GROUP  BY F.x,
                   F.y
         HAVING Count(*) > 1)) AS FUNCT
WHERE  x1 <= y1
ORDER  BY x1;
