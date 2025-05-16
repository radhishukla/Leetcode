WITH Boarding AS (
    SELECT 
        person_name,
        weight,
        turn,
        SUM(weight) OVER (ORDER BY turn) AS cum_weight
    FROM Queue
)
SELECT person_name
FROM Boarding
WHERE cum_weight <= 1000
ORDER BY cum_weight DESC
LIMIT 1;
