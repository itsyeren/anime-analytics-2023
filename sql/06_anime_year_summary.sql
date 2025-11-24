-- 06_anime_year_summary.sql
-- Purpose:
-- Produce year-by-type anime summary metrics including counts,
-- average score, and average scoring volume.

CREATE OR REPLACE TABLE `anime-2023-478915.anime_dataset.anime_year_summary` AS
SELECT
  start_year,
  type,
  COUNT(*) AS anime_count,
  AVG(score) AS avg_score,
  AVG(scored_by) AS avg_scored_by
FROM `anime-2023-478915.anime_dataset.anime_general`
WHERE start_year IS NOT NULL
GROUP BY start_year, type
ORDER BY start_year, type;
