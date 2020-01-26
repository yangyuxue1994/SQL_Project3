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
SELECT V.origin_city, CAST(V.VAL as FLOAT) / CAST(V2.VAL as FLOAT) * 100 AS PERC
FROM VAR2 AS V2,
    (SELECT *
    FROM VAR1
    UNION SELECT *
    FROM VAR3) AS V
WHERE V.origin_city = V2.origin_city
ORDER BY PERC

-- Rows Returned: 327
-- Query Execution Time: 00:00:38.763
-- Output Columns:
-- Guam TT	0
-- Pago Pago TT	0
-- Aguadilla PR	28.8973384030418
-- Anchorage AK	31.8120805369128
-- San Juan PR	33.6605316973415
-- Charlotte Amalie VI	39.5588235294118
-- Ponce PR	40.9836065573771
-- Fairbanks AK	50.1165501165501
-- Kahului HI	53.5144713526285
-- Honolulu HI	54.7390288236822
-- San Francisco CA	55.8288645371882
-- Los Angeles CA	56.0808908229873
-- Seattle WA	57.6093877922314
-- Long Beach CA	62.176439513999
-- New York NY	62.371834136728
-- Kona HI	63.1607929515419
-- Las Vegas NV	64.9202563720376
-- Christiansted VI	65.1006711409396
-- Newark NJ	65.8499710969807
-- Plattsburgh NY	66.6666666666667