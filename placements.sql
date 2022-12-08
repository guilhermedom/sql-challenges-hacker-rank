/* Problem: You are given three tables: Students, Friends and Packages.
Students contains two columns: ID and Name. Friends contains two
columns: ID and Friend_ID (ID of the ONLY best friend). Packages
contains two columns: ID and Salary (offered salary in $ thousands per
month).

Write a query to output the names of those students whose best friends
got offered a higher salary than them. Names must be ordered by the
salary amount offered to the best friends. It is guaranteed that no two
students got same salary offer. */

SELECT NAME
FROM   students S
       INNER JOIN friends F
               ON S.id = F.id
       INNER JOIN packages P
               ON S.id = P.id
       INNER JOIN packages P2
               ON F.friend_id = P2.id
WHERE  P.salary < P2.salary
ORDER  BY P2.salary;
