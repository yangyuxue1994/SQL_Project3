WITH VAL AS (
    SELECT F1.origin_city, F1.dest_city
    FROM Flights AS F1
    WHERE F1.dest_city NOT IN (
        SELECT F2.dest_city
        FROM Flights AS F2
        WHERE F2.origin_city = 'Seattle WA'
    )
),
VAL1 AS (
    SELECT F1.origin_city, F1.dest_city
    FROM Flights AS F1
    WHERE F1.origin_city = 'Seattle WA'
)
SELECT DISTINCT V.dest_city AS city
FROM VAL AS V, VAL1 AS V1
WHERE V1.dest_city = V.origin_city
    AND V.dest_city != 'Seattle WA'
ORDER BY city;

-- Rows Returned: 256
-- Query Execution Time: 00:00:22.156
-- Output Columns: (first 20 rows)

-- city
-- ------------
-- Aberdeen SD
-- Abilene TX
-- Adak Island AK
-- Aguadilla PR
-- Akron OH
-- Albany GA
-- Albany NY
-- Alexandria LA
-- Allentown/Bethlehem/Easton PA
-- Alpena MI
-- Amarillo TX
-- Appleton WI
-- Arcata/Eureka CA
-- Asheville NC
-- Ashland WV
-- Aspen CO
-- Atlantic City NJ
-- Augusta GA
-- Bakersfield CA
-- Bangor ME



