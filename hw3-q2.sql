-- q2

SELECT temp.origin_city, temp.dest_city, temp.time
FROM 

(SELECT f1.origin_city, f1.dest_city, MIN(f1.actual_time) AS time
FROM Flights AS f1
WHERE f1.canceled!=1
GROUP BY f1.origin_city, f1.dest_city) temp,

(SELECT f2.origin_city, MIN(f2.actual_time) AS time
FROM Flights AS f2
WHERE f2.canceled!=1
GROUP BY f2.origin_city) min_t

WHERE temp.origin_city=min_t.origin_city
AND temp.time=min_t.time
ORDER BY temp.time, temp.origin_city
;

--- number of rows: 339
--- how long the query took: 19 sec
--- output:

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
