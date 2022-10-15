SELECT Department.name AS Department, ERank.name AS Employee, ERank.salary AS Salary 
FROM (SELECT name, salary, departmentId, 
        RANK() OVER (PARTITION BY departmentId ORDER BY salary DESC) AS salaryRank
    FROM Employee) AS ERank, Department
WHERE ERank.salaryRank = 1 AND ERank.departmentId = Department.id;