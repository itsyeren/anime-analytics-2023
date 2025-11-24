-- 08_user_activity_summary.sql
-- Purpose:
-- Summarize user-level rating behavior including total ratings
-- and average rating score, formatted for clean analytics.

CREATE OR REPLACE TABLE `anime-2023-478915.anime_dataset.user_activity_summary` AS
SELECT
  user_id,
  username,
  COUNT(*) AS rating_count,
  FORMAT('%.2f', AVG(rating)) AS avg_user_rating
FROM `anime-2023-478915.anime_dataset.score_details`
GROUP BY user_id, username
ORDER BY rating_count DESC;
