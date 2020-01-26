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
SELECT DISTINCT V.dest_city
FROM VAL AS V, VAL1 AS V1
WHERE V1.dest_city = V.origin_city
    AND V.dest_city != 'Seattle WA'

-- Rows Returned: 256
-- Query Execution Time: 00:00:22.156
-- Output Columns:
-- Dothan AL
-- Toledo OH
-- Peoria IL
-- Yuma AZ
-- Bakersfield CA
-- Daytona Beach FL
-- Laramie WY
-- North Bend/Coos Bay OR
-- Erie PA
-- Guam TT
-- Columbus GA
-- Wichita Falls TX
-- Hartford CT
-- Myrtle Beach SC
-- Arcata/Eureka CA
-- Kotzebue AK
-- Medford OR
-- Providence RI
-- Green Bay WI
-- Santa Maria CA