-- Goal:
-- Find authors who viewed their own articles.
-- Each author should appear only once in the result.

SELECT DISTINCT 
    author_id AS id   -- Author ID (renamed as 'id')

FROM Views
-- Keep only rows where the viewer is also the author
WHERE viewer_id = author_id

-- Sort results by author ID
ORDER BY id;
