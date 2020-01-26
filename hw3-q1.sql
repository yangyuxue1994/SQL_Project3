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
SELECT *
FROM VAR1
UNION
SELECT *
FROM VAR2

-- Rows Returned: 2351
-- Query Execution Time: 00:00:44.599
-- Output Columns:
-- Boston MA	Myrtle Beach SC
-- Denver CO	Reno NV
-- Anchorage AK	Chicago IL
-- Las Vegas NV	Minneapolis MN
-- Anchorage AK	Los Angeles CA
-- Charlotte NC	Norfolk VA
-- Indianapolis IN	Las Vegas NV
-- Fort Myers FL	New York NY
-- Brownsville TX	Dallas/Fort Worth TX
-- Los Angeles CA	Spokane WA
-- Newark NJ	Richmond VA
-- Hartford CT	Philadelphia PA
-- Indianapolis IN	Phoenix AZ
-- Amarillo TX	Dallas/Fort Worth TX
-- Dallas TX	Denver CO
-- Cincinnati OH	Scranton/Wilkes-Barre PA
-- Orlando FL	San Antonio TX
-- Columbia SC	Newark NJ
-- Greensboro/High Point NC	Newark NJ
-- Austin TX	Dallas/Fort Worth TX


-- SELECT DISTINCT F1.origin_city,F1.dest_city
-- FROM Flights AS F1
-- WHERE F1.origin_city > F1.dest_city