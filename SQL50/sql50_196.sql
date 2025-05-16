DELETE p
FROM Person p
LEFT JOIN (
    SELECT email, MIN(id) AS min_id
    FROM Person
    GROUP BY email
) AS keepers ON p.email = keepers.email AND p.id = keepers.min_id
WHERE keepers.min_id IS NULL;
