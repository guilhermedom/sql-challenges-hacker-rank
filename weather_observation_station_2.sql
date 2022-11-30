/* Problem: Query the following two values from the STATION table:

1. The sum of all values in LAT_N rounded to a scale of 2 decimal
places.
2. The sum of all values in LONG_W rounded to a scale of 2 decimal
places. */

SELECT Round(Sum(lat_n), 2),
       Round(Sum(long_w), 2)
FROM   station;
