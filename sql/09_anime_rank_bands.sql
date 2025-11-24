-- 09_anime_rank_bands.sql
-- Purpose:
-- Create rank-based buckets and summarize anime performance within
-- each group by computing counts, average score, and scoring volume.

CREATE OR REPLACE TABLE `anime-2023-478915.anime_dataset.anime_rank_bands` AS
WITH banded AS (
  SELECT
    anime_id,
    title,
    score,
    scored_by,
    rank,
    CASE
      WHEN rank BETWEEN 1 AND 100 THEN '01_top_100'
      WHEN rank BETWEEN 101 AND 500 THEN '02_101_500'
      WHEN rank BETWEEN 501 AND 1000 THEN '03_501_1000'
      WHEN rank BETWEEN 1001 AND 5000 THEN '04_1001_5000'
      ELSE '05_5001_plus'
    END AS rank_band
  FROM `anime-2023-478915.anime_dataset.anime_general`
  WHERE rank IS NOT NULL
)
SELECT
  rank_band,
  COUNT(*) AS anime_count,
  FORMAT('%.2f', AVG(score)) AS avg_score,
  SAFE_CAST(AVG(scored_by) AS INT64) AS avg_scored_by
FROM banded
GROUP BY rank_band
ORDER BY rank_band;
