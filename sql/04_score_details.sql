-- 04_score_details.sql
-- Purpose:
-- Build the core fact table combining user ratings with cleaned user profiles
-- and website-level anime metadata. This dataset serves as the foundation for
-- exploratory data analysis and modeling.

CREATE OR REPLACE TABLE `anime-2023-478915.anime_dataset.score_details` AS
SELECT
  sc.user_id,
  sc.Username AS username,
  sc.anime_id,
  wd.name AS anime_title,

  -- user rating
  sc.rating AS rating,

  -- anime metadata
  wd.score       AS anime_score,
  wd.type        AS anime_type,
  wd.ranked      AS ranked_position
FROM `anime-2023-478915.anime_dataset.users_score` sc

INNER JOIN `anime-2023-478915.anime_dataset.users_details_cleaned` ud
  ON sc.username = ud.username

LEFT JOIN `anime-2023-478915.anime_dataset.anime_website_details` wd
  ON wd.anime_id = sc.anime_id;
