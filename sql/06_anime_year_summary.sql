-- 06_anime_year_summary.sql
-- Purpose:
-- Produce year-by-type anime summary metrics including counts,
-- average score, and average scoring volume.

CREATE OR REPLACE TABLE `anime-2023-478915.anime_dataset.anime_genre_summary` AS
WITH exploded AS (
  SELECT
    anime_id,
    title,
    score,
    scored_by,
    popularity,
    start_year,
    type,
    TRIM(genre_item) AS genre
  FROM `anime-2023-478915.anime_dataset.anime_general_cleaned`,
  UNNEST(SPLIT(genre, ',')) AS genre_item
)
SELECT
  genre,
  type,
  COUNT(*) AS anime_count,
  AVG(score) AS avg_score,
  AVG(scored_by) AS avg_scored_by,
  AVG(popularity) AS avg_popularity
FROM exploded
GROUP BY genre, type
ORDER BY anime_count DESC;
