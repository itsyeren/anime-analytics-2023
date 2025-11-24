-- 07_anime_genre_summary.sql
-- Purpose:
-- Generate genre-level analytics by exploding multi-genre strings into
-- individual rows and aggregating score, popularity, and scoring volume.

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
  FORMAT('%.2f', AVG(score)) AS avg_score,
  SAFE_CAST(AVG(scored_by) AS INT64) AS avg_scored_by,
  SAFE_CAST(AVG(popularity) AS INT64) AS avg_popularity
FROM exploded
GROUP BY genre, type
ORDER BY anime_count DESC;
