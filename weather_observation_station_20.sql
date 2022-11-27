/* Problem: A median is defined as a number separating the higher half
of a data set from the lower half. Query the median of the Northern
Latitudes (LAT_N) from STATION and round your answer to 4 decimal
places. */

SET @row_num := -1;

WITH counter AS (
    SELECT   lat_n,
             @ROW_NUM:=@ROW_NUM + 1 AS row_num
    FROM     station
    ORDER BY lat_n )

SELECT round(avg(lat_n), 4) AS median_lat_n
FROM   counter
WHERE  counter.row_num IN (floor(@ROW_NUM / 2),
                             ceil(@ROW_NUM / 2));
