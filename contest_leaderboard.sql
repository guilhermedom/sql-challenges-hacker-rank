/* Problem: You did such a great job helping Julia with her last coding
contest challenge that she wants you to work on this one, too!

The total score of a hacker is the sum of their maximum scores for all
of the challenges. Write a query to print the hacker_id, name, and total
score of the hackers ordered by the descending score. If more than one
hacker achieved the same total score, then sort the result by ascending
hacker_id. Exclude all hackers with a total score of 0 from your result. */

WITH max_scores
     AS (SELECT hacker_id,
                Max(score) AS max_score
         FROM   hackers
                NATURAL JOIN submissions
         GROUP  BY hacker_id,
                   challenge_id)
SELECT hacker_id,
       NAME,
       Sum(max_score)
FROM   hackers
       NATURAL JOIN max_scores
GROUP  BY hacker_id,
          NAME
HAVING Sum(max_score) > 0
ORDER  BY Sum(max_score) DESC,
          hacker_id;
