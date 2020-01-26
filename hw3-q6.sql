SELECT DISTINCT F1.origin_city AS city
FROM Flights AS F1
WHERE F1.origin_city NOT IN (
    SELECT DISTINCT F4.dest_city
    FROM Flights AS F3, Flights AS F4
    WHERE F3.dest_city = F4.origin_city
        AND F3.origin_city = 'Seattle WA'
) AND F1.origin_city NOT IN (
    SELECT DISTINCT F2.dest_city
    FROM Flights AS F2
    WHERE F2.origin_city = 'Seattle WA'
)

-- Rows Returned: 4
-- Query Execution Time: 00:00:47.518
-- Output Columns:


-- city
-- ---------------
-- Devils Lake ND
-- Hattiesburg/Laurel MS
-- St. Augustine FL
-- Victoria TX