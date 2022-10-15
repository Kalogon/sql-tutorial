SELECT request_at as Day, round(sum(canceled) / count(status), 2) AS 'Cancellation Rate'
FROM (
SELECT request_at, status,
    CASE
        WHEN status = 'completed' THEN 0
        ELSE 1
    END AS canceled
FROM Trips
WHERE Trips.client_id NOT IN (SELECT users_id FROM Users WHERE banned = 'Yes')
    AND Trips.driver_id NOT IN (SELECT users_id FROM Users WHERE banned = 'Yes')
    AND request_at BETWEEN '2013-10-01' AND '2013-10-03' 
) AS T
GROUP BY request_at;