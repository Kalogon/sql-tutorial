SELECT id, visit_date, people
FROM
(SELECT id, visit_date, people,
    LAG(people, 2) OVER () >= 100 AS second_prev,
    LAG(people, 1) OVER () >= 100 AS prev,
    people >= 100 AS self,
    LEAD(people, 1) OVER () >= 100 AS next,
    LEAD(people, 2) OVER () >= 100 AS second_next
FROM Stadium) AS T
WHERE 
    (second_prev AND prev AND self) OR
    (prev AND self AND next) OR
    (self AND next AND second_next)