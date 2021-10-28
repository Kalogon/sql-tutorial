SELECT CASE 
    WHEN A = B AND B = C THEN "Equilateral"
    WHEN A + B <= C OR B + C <= A OR C + A <= B THEN "Not A Triangle"
    WHEN A = B OR B = C OR C = A THEN "Isosceles"
    ELSE "Scalene" END
FROM TRIANGLES;

SELECT CONCAT(Name, "(", SUBSTR(Occupation, 1, 1), ")")
FROM OCCUPATIONS
ORDER BY Name;

SELECT CONCAT("There are a total of ", count, " ", lower_occupation, "s.")
FROM(
    SELECT count(Name) AS count, LOWER(Occupation) AS lower_occupation
    FROM OCCUPATIONS
    GROUP BY Occupation
    ORDER BY count, lower_occupation
) AS occ_count;

SELECT MAX(Doctor), MAX(Professor), MAX(Singer), MAX(Actor)
FROM (
    SELECT NAME, 
        CASE WHEN Occupation = "Doctor" THEN NAME END AS Doctor,
        CASE WHEN Occupation = "Professor" THEN NAME END AS Professor,
        CASE WHEN Occupation = "Singer" THEN NAME END AS Singer,
        CASE WHEN Occupation = "Actor" THEN NAME END AS Actor,
        ROW_NUMBER() OVER(PARTITION BY Occupation ORDER BY NAME) AS row_num
    FROM OCCUPATIONS
) AS occ_row
GROUP BY row_num;

SELECT founders.company_code, founders.founder, company_stats.lead_manager_count, company_stats.senior_manager_count, company_stats.manager_count, company_stats.employee_count
FROM 
    (
        SELECT DISTINCT company_code, founder
        FROM Company
    ) AS founders
    JOIN
    (
        SELECT company_code, count(distinct lead_manager_code) AS lead_manager_count, count(distinct senior_manager_code) AS senior_manager_count, count(distinct manager_code) AS manager_count, count(distinct employee_code) AS employee_count
        FROM Employee
        GROUP BY company_code
    ) AS company_stats
    ON founders.company_code = company_stats.company_code
ORDER BY founders.company_code;

SELECT N, CASE 
        WHEN P IS NULL THEN "Root"
        WHEN N IN (SELECT P FROM BST) THEN "Inner"
        ELSE "Leaf" END
FROM BST
ORDER BY N;