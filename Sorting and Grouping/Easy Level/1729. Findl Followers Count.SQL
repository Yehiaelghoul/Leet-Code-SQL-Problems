-- Goal:
-- For each user, count how many followers they have.

SELECT 
    user_id,
    
    -- Count followers of each user
    COUNT(follower_id) AS followers_count

FROM Followers
-- Group by the user being followed
GROUP BY user_id;
