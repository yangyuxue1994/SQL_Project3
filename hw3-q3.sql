SELECT DISTINCT F1.origin_city
FROM Flights AS F1
WHERE NOT EXISTS (
    SELECT F2.origin_city
    FROM Flights AS F2
    WHERE F1.origin_city = F2.origin_city
        AND F2.actual_time >= 180
)
ORDER BY F1.origin_city

-- Rows Returned: 109
-- Query Execution Time: 00:00:13.016
-- Output Columns:
-- Aberdeen SD
-- Abilene TX
-- Alpena MI
-- Ashland WV
-- Augusta GA
-- Barrow AK
-- Beaumont/Port Arthur TX
-- Bemidji MN
-- Bethel AK
-- Binghamton NY
-- Brainerd MN
-- Bristol/Johnson City/Kingsport TN
-- Butte MT
-- Carlsbad CA
-- Casper WY
-- Cedar City UT
-- Chico CA
-- College Station/Bryan TX
-- Columbia MO
-- Columbus GA