SELECT DISTINCT num AS ConsecutiveNums 
FROM (
    SELECT 
        num,
        lag(num, 1) OVER () as prev_num,
        lag(num, 2) OVER () as second_prev_num
    FROM Logs
) AS T
WHERE num = prev_num AND prev_num = second_prev_num