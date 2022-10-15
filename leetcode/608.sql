SELECT distinct id,
    CASE 
        WHEN parent is null THEN 'Root'
        WHEN child is null THEN 'Leaf'
        ELSE 'Inner'
    END AS type
FROM 
    (SELECT T1.p_id AS parent, T1.id AS id, T2.id AS child
    FROM (Tree T1 LEFT OUTER JOIN Tree T2 ON T1.id = T2.p_id)
    ) AS T
