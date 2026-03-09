-- WHICH ROUTE EXPERIENCE THE HIGHEST AVERAGE DELAYS  -- 

SELECT 
CONCAT(Departure_Station , ' to ' , Arrival_Destination) AS Route
, ROUND(AVG(Delay_Minutes),2) AS Avg_Mins_Delay
,COUNT(*) AS Delay_Count
FROM railway
WHERE Delay_minutes > 0
GROUP BY Route
ORDER BY Avg_Mins_Delay DESC
LIMIT 5 
;

-- WHAT ARE THE MOST COMMON REASONS FOR TRAIN DELAYS? --
SELECT 
Reason_for_delay
, COUNT(*) AS Frequency
FROM railway
WHERE TRIM(Reason_for_Delay) <> ''  -- Filtered out empty delay reasons to ensure only valid delay causes were analysed.
GROUP BY Reason_for_Delay
ORDER BY Frequency DESC
;


-- DO LONGER DELAYS LEAD TO MORE REFUND REQUESTS?

SELECT Refund_Request
,ROUND(AVG(delay_minutes),2) AS avg_delay
,count(*) AS journeys
FROM railway
GROUP BY refund_request
;
-- Journeys with refund requests experienced significantly higher average delays compared to journeys without refund requests, suggesting delays strongly influence customer compensation claims.

-- WHICH STATIONS HANDLE THE HIGHEST NUMBER OF JOURNEYS
SELECT departure_station
, COUNT(*) AS journeys
FROM railway
GROUP BY departure_station
ORDER BY Journeys DESC
;

-- WHICH ROUTE GENERATES THE MOST REVENUE

SELECT 
CONCAT(Departure_Station , ' to ' , Arrival_Destination) AS Route
, SUM(Price) AS total_revenue
FROM Railway
GROUP BY Route
ORDER BY total_revenue DESC
LIMIT 10 
;
