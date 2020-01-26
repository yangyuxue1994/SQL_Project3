SELECT DISTINCT F1.origin_city AS city
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

-- city       
-- -----------
-- Aberdeen SD
-- Abilene TX 
-- Alpena MI  
-- Ashland WV 
-- Augusta GA 
-- Barrow AK  
-- Beaumont/Po
-- Bemidji MN 
-- Bethel AK  
-- Binghamton 
-- Brainerd MN
-- Bristol/Joh
-- Butte MT   
-- Carlsbad CA
-- Casper WY  
-- Cedar City 
-- Chico CA   
-- College Sta
-- Columbia MO
-- Columbus GA
