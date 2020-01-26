-- hw3-q1
-- author: AJ
-- revise: CY

WITH VAR1 AS (
SELECT *
FROM (
    SELECT DISTINCT F1.origin_city,F1.dest_city
    FROM Flights AS F1
    WHERE NOT EXISTS (
        SELECT *
        FROM Flights as F2
        WHERE F2.dest_city = F1.origin_city
            AND F1.dest_city = F2.origin_city
    )) AS T),
VAR2 AS (
    SELECT DISTINCT F1.origin_city,F1.dest_city
    FROM Flights AS F1, Flights AS F2
    WHERE F1.origin_city = F2.dest_city 
        AND F1.dest_city = F2.origin_city
        AND F1.origin_city < F1.dest_city
)
SELECT COUNT(*) AS num_connected_cities
FROM (
SELECT *
FROM VAR1
UNION
SELECT *
FROM VAR2 ) u;

-- Rows Returned: 1
-- Query Execution Time: 00:00:44.599
-- Output Columns:


-- num_connected_cities
-- ---------------
-- 2351
