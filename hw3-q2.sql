WITH VAL AS (
    SELECT DISTINCT F2.origin_city, F2.dest_city, F2.actual_time
    FROM Flights AS F2, 
        (SELECT F1.origin_city AS LOC,
            MIN(F1.actual_time) AS NUM
        FROM Flights AS F1
        WHERE F1.canceled = 0
        GROUP BY F1.origin_city) AS MINIM
    WHERE F2.actual_time = MINIM.NUM
        AND F2.origin_city = MINIM.LOC)
SELECT *
FROM VAL AS V1
-- WHERE V1.dest_city NOT IN (
--     SELECT V2.origin_city
--     FROM VAL AS V2
--     WHERE V2.dest_city = V1.origin_city
-- )
-- WHERE NOT EXISTS (
--     SELECT *
--     FROM VAL AS V2
--     WHERE V1.dest_city = V2.origin_city
--         AND V1.origin_city = V2.dest_city
--         AND V1.dest_city > V2.dest_city
-- )
ORDER BY V1.actual_time, V1.origin_city

-- Rows Returned: 339
-- Query Execution Time: 00:00:16.584
-- Output Columns: (20 rows)

-- origin_city      dest_city       time      
-- ---------------  --------------  ----------
-- Bend/Redmond OR  Los Angeles CA  10        
-- Burbank CA       New York NY     10        
-- Las Vegas NV     Chicago IL      10        
-- New York NY      Nashville TN    10        
-- Newark NJ        Detroit MI      10        
-- Sacramento CA    Atlanta GA      10        
-- Washington DC    Minneapolis MN  10        
-- Boise ID         Chicago IL      11        
-- Boston MA        Philadelphia P  11        
-- Buffalo NY       Orlando FL      11        
-- Cincinnati OH    New Haven CT    11        
-- Denver CO        Honolulu HI     11        
-- Denver CO        Orlando FL      11        
-- Denver CO        Philadelphia P  11        
-- Fort Myers FL    Chicago IL      11        
-- Houston TX       Salt Lake City  11        
-- Minneapolis MN   Newark NJ       11        
-- Pittsburgh PA    Dallas/Fort Wo  11        
-- Indianapolis IN  Houston TX      12        
-- Phoenix AZ       Dallas/Fort Wo  12 