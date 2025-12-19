-- Goal:
-- Find tweets where the content length
-- is greater than 15 characters.

SELECT 
    tweet_id   -- Unique ID of the tweet

FROM Tweets
-- Filter tweets based on content length
WHERE LENGTH(content) > 15;
