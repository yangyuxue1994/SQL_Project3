--hw3-q1

--- All distinct combination pairs of origin_city & dest_city
WITH t1 AS (
	SELECT DISTINCT f0.origin_city, f0.dest_city
FROM FLIGHTS AS f0
WHERE f0.canceled!=1)

--- All duplicates combinations (Seattle-Boston and Bosto-Seattle)
,t2 AS (SELECT DISTINCT f1.origin_city, f1.dest_city
FROM FLIGHTS AS f1
WHERE f1.canceled!=1
EXCEPT 
SELECT DISTINCT f2.dest_city, f2.origin_city
FROM FLIGHTS AS f2
WHERE f2.canceled!=1)

--- Duplicates/2+Unique Combination=Unique Combination
SELECT
(SELECT COUNT(*)/2 FROM (SELECT * FROM t1 EXCEPT SELECT * FROM t2) tmp) +
(SELECT COUNT(*) FROM t2) AS num_connected_cities;


--- number of rows: 1
--- how long the query took: 55s
--- output:

-- num_connected_cities
-- 2351

