--hw3-q8

WITH non_cancel_flights AS (
SELECT f.day_of_week_id, f.dest_city, COUNT(f.fid) non_cancel
FROM FLIGHTS AS f
WHERE f.canceled!= 1
GROUP BY f.month_id, f.day_of_month, f.day_of_week_id, f.dest_city)

, ave_flights AS (
SELECT n.day_of_week_id, n.dest_city, AVG(non_cancel) avg_flights
FROM non_cancel_flights AS n
GROUP BY n.day_of_week_id, n.dest_city 
)

, max_ave_flights AS (
SELECT a.day_of_week_id, MAX(avg_flights) max_avg_flights
FROM ave_flights AS a
GROUP BY a.day_of_week_id 
)

, sec_max_ave_flights AS (
SELECT a.day_of_week_id, MAX(avg_flights) max_avg_flights
FROM ave_flights AS a, max_ave_flights AS m
WHERE a.day_of_week_id=m.day_of_week_id
AND a.avg_flights < m.max_avg_flights 
GROUP BY a.day_of_week_id 
)

, map_city AS (
SELECT a.day_of_week_id, a.dest_city, a.avg_flights
FROM ave_flights AS a, 
(SELECT *
FROM max_ave_flights
UNION ALL
SELECT *
FROM sec_max_ave_flights
) u
WHERE 
a.day_of_week_id=u.day_of_week_id 
AND a.avg_flights=u.max_avg_flights
)

SELECT w.day_of_week AS day_of_week, map_city.dest_city AS dest_city, map_city.avg_flights AS avg_flights
FROM map_city, WEEKDAYS AS w
WHERE w.did=map_city.day_of_week_id
ORDER BY w.did ASC, map_city.avg_flights DESC
;

--- number of rows: 14
--- how long the query took: 54s
--- output:

-- day_of_week  dest_city   avg_flights
-- -----------  ----------  -----------
-- Monday       Chicago IL  2092.0     
-- Monday       Atlanta GA  2067.0     
-- Tuesday      Chicago IL  2350.0     
-- Tuesday      Atlanta GA  2273.5     
-- Wednesday    Chicago IL  2345.75    
-- Wednesday    Atlanta GA  2292.25    
-- Thursday     Chicago IL  2388.75    
-- Thursday     Atlanta GA  2277.0     
-- Friday       Chicago IL  2408.4     
-- Friday       Atlanta GA  2289.6     
-- Saturday     Chicago IL  2285.4     
-- Saturday     Atlanta GA  2242.8     
-- Sunday       Chicago IL  2300.4     
-- Sunday       Atlanta GA  2229.0  