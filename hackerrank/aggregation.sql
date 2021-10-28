SELECT count(ID)
FROM CITY
WHERE population > 100000;

SELECT sum(population)
FROM CITY
WHERE DISTRICT = "California";

SELECT avg(population)
FROM CITY
WHERE DISTRICT = "California";

SELECT TRUNCATE(avg(population), 0)
FROM CITY;

SELECT sum(population)
FROM CITY
WHERE COUNTRYCODE = "JPN";

SELECT max(population) - min(population)
FROM CITY;

SELECT CEIL(avg(Salary) - avg(Mis_Salary))
FROM (
    SELECT ID, NAME, Salary, 
        CAST(REPLACE(CAST(Salary as CHAR), "0", "") AS UNSIGNED) AS Mis_Salary
    FROM EMPLOYEES
    WHERE Salary > 1000 AND Salary < 100000 
) AS TEMP;

SELECT Emp_earns.total_earnings, count(*) 
FROM (
    SELECT (months * salary) AS total_earnings
    FROM Employee
) AS Emp_earns
GROUP BY Emp_earns.total_earnings
ORDER BY Emp_earns.total_earnings DESC 
LIMIT 1;

SELECT ROUND(sum(LAT_N), 2) AS lat, ROUND(sum(LONG_W), 2) AS lon
FROM STATION;

SELECT ROUND(sum(LAT_N), 4)
FROM STATION
WHERE LAT_N > 38.7880 AND LAT_N < 137.2345;

SELECT ROUND(max(LAT_N), 4)
FROM STATION
WHERE LAT_N < 137.2345;

SELECT ROUND(max(LAT_N), 4)
FROM STATION
WHERE LAT_N < 137.2345;

SELECT ROUND(LONG_W, 4)
FROM STATION
WHERE LAT_N < 137.2345
ORDER BY LAT_N DESC
LIMIT 1;

SELECT round(min(LAT_N), 4)
FROM STATION
WHERE LAT_N > 38.7780;

SELECT round(LONG_W, 4)
FROM STATION
WHERE LAT_N > 38.7780
ORDER BY LAT_N
LIMIT 1;

SELECT round(max(LAT_N) - min(LAT_N) + max(LONG_W) - min(LONG_W), 4)
FROM STATION;

SELECT round(sqrt(pow(max(LAT_N) - min(LAT_N), 2) + pow(max(LONG_W) - min(LONG_W), 2)), 4)
FROM STATION;

SELECT ROUND(LAT_N, 4)
FROM (
    SELECT LAT_N,
        RANK() OVER(ORDER BY LAT_N) AS RANK_LAT_N
    FROM STATION
) AS TEMP
WHERE RANK_LAT_N IN (SELECT ceil(count(ID)/2) AS RANK_LAT_N FROM STATION);