WITH UserRatings AS (
    SELECT 
        u.name,
        COUNT(*) AS rating_count
    FROM MovieRating mr
    JOIN Users u ON mr.user_id = u.user_id
    GROUP BY u.name
),

MaxUserCount AS (
    SELECT MAX(rating_count) AS max_count FROM UserRatings
),

TopUsers AS (
    SELECT name
    FROM UserRatings, MaxUserCount
    WHERE rating_count = max_count
    ORDER BY name
    LIMIT 1
),

FebRatings AS (
    SELECT 
        mr.movie_id,
        AVG(mr.rating) AS avg_rating
    FROM MovieRating mr
    WHERE mr.created_at >= '2020-02-01' AND mr.created_at <= '2020-02-29'
    GROUP BY mr.movie_id
),

MaxAvgRating AS (
    SELECT MAX(avg_rating) AS max_avg FROM FebRatings
),

TopMovies AS (
    SELECT m.title
    FROM FebRatings fr
    JOIN Movies m ON fr.movie_id = m.movie_id
    JOIN MaxAvgRating mar ON fr.avg_rating = mar.max_avg
    ORDER BY m.title
    LIMIT 1
)

SELECT name AS results FROM TopUsers
UNION ALL
SELECT title FROM TopMovies;
