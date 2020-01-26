SELECT C.name
FROM Carriers AS C
WHERE C.cid IN (
    SELECT F.carrier_id
    FROM Flights AS F
    WHERE F.origin_city = 'Seattle WA'
        AND F.dest_city = 'San Francisco CA')

-- Rows Returned: 4
-- Query Execution Time: 00:00:04.570
-- Output Columns:

-- carrier             
-- --------------------
-- Alaska Airlines Inc.
-- SkyWest Airlines Inc
-- United Air Lines Inc
-- Virgin America 