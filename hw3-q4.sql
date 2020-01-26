WITH VAR1 AS (
    SELECT F1.origin_city, COUNT(F1.origin_city) AS VAL
    FROM Flights AS F1
    WHERE F1.canceled = 0
        AND F1.actual_time < 180
    GROUP BY F1.origin_city
),
VAR2 AS (
    SELECT F1.origin_city,  COUNT(F1.origin_city) AS VAL
    FROM Flights AS F1
    WHERE F1.canceled = 0
    GROUP BY F1.origin_city
),
VAR3 AS (
    SELECT F1.origin_city, 0 AS VAL
    FROM Flights AS F1
    WHERE F1.origin_city NOT IN
        (SELECT F2.origin_city
        FROM Flights AS F2
        WHERE F2.canceled = 0
            AND F2.actual_time < 180
        GROUP BY F2.origin_city)
    GROUP BY F1.origin_city
)
SELECT V.origin_city AS origin_city, CAST(V.VAL as FLOAT) / CAST(V2.VAL as FLOAT) * 100 AS percentage
FROM VAR2 AS V2,
    (SELECT *
    FROM VAR1
    UNION SELECT *
    FROM VAR3) AS V
WHERE V.origin_city = V2.origin_city
ORDER BY percentage;

-- Rows Returned: 327
-- Query Execution Time: 00:00:38.763
-- Output Columns: (first 20 rows)


-- city        percentage
-- ----------  ----------
-- Guam TT     0         
-- Pago Pago   0         
-- Aguadilla   28.8973384
-- Anchorage   31.8120805
-- San Juan P  33.6605316
-- Charlotte   39.5588235
-- Ponce PR    40.9836065
-- Fairbanks   50.1165501
-- Kahului HI  53.5144713
-- Honolulu H  54.7390288
-- San Franci  55.8288645
-- Los Angele  56.0808908
-- Seattle WA  57.6093877
-- Long Beach  62.1764395
-- New York N  62.3718341
-- Kona HI     63.1607929
-- Las Vegas   64.9202563
-- Christians  65.1006711
-- Newark NJ   65.8499710
-- Plattsburg  66.6666666