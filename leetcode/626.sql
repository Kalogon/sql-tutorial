SELECT 
    id,
    CASE
        WHEN id % 2 = 1 THEN ( 
            CASE 
                WHEN lead(student, 1) OVER () IS NULL THEN student
                ELSE lead(student, 1) OVER ()
            END
        )
        WHEN id % 2 = 0 THEN lag(student, 1) OVER ()
    END AS student
FROM Seat