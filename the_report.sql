/* Problem: You are given two tables: Students and Grades.

Ketty gives Eve a task to generate a report containing three columns:
Name, Grade and Mark. Ketty doesn't want the NAMES of those students who
received a grade lower than 8. The report must be in descending order by
grade -- i.e. higher grades are entered first. If there is more than one
student with the same grade (8-10) assigned to them, order those
particular students by their name alphabetically. Finally, if the grade
is lower than 8, use "NULL" as their name and list them by their grades
in descending order. If there is more than one student with the same
grade (1-7) assigned to them, order those particular students by their
marks in ascending order.

Write a query to help Eve. */

-- Grades are discrete values going from 1 to 10 and their are buckets
-- for marks ranges. Marks can be used to find the grades.
SELECT CASE
		 -- Ignore students with a grade smaller than 8. 
         WHEN G.grade < 8 THEN NULL
         ELSE S.NAME
       END,
       G.grade,
       S.marks
FROM   students S
       INNER JOIN grades G
               ON S.marks BETWEEN G.min_mark AND G.max_mark
ORDER  BY G.grade DESC,
          S.NAME,
		  -- ORDER BY marks works for students with grade (1-7) because
		  -- their names are selected as the same name, NULL.
          S.marks;
