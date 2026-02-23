-- CTE to count ratings per user
WITH UserRatingCount AS (
    SELECT 
        MR.user_id,
        COUNT(*) AS rating_count
    FROM MovieRating MR
    GROUP BY MR.user_id
),
TopUser AS (
    SELECT TOP 1 U.name AS results
    FROM UserRatingCount UR
    JOIN Users U ON UR.user_id = U.user_id
    ORDER BY UR.rating_count DESC, U.name ASC
),

-- CTE to calculate average rating per movie in Feb 2020
MovieAvgRatingFeb AS (
    SELECT 
        MR.movie_id,
        AVG(MR.rating * 1.0) AS avg_rating
    FROM MovieRating MR
    WHERE MR.created_at >= '2020-02-01' AND MR.created_at < '2020-03-01'
    GROUP BY MR.movie_id
),
TopMovie AS (
    SELECT TOP 1 M.title AS results
    FROM MovieAvgRatingFeb MF
    JOIN Movies M ON MF.movie_id = M.movie_id
    ORDER BY MF.avg_rating DESC, M.title ASC
)

-- Final result
SELECT results FROM TopUser
UNION ALL
SELECT results FROM TopMovie;
