-- Solution 1
SELECT 
    CASE
        WHEN count(salary) = 0 THEN null
        ELSE avg(salary)
    END AS SecondHighestSalary 
FROM (
    SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS salaryRank
    FROM Employee
) AS T
WHERE salaryRank = 2;

-- Solution 2
SELECT 
    (SELECT salary FROM (
        SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS salaryRank
        FROM Employee
    ) AS T
    WHERE salaryRank = 2
    LIMIT 1) AS SecondHighestSalary;