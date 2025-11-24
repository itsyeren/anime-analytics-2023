-- 02_anime_pruned.sql
-- Purpose:
-- Remove unnecessary or redundant columns from the dataset by recreating the
-- table with only the selected fields kept. BigQuery does not support DROP COLUMN
-- directly, so we define the desired schema explicitly.

SELECT
  anime_id,
  Name AS name,
  Score AS score,
  Type AS type,
  Duration AS duration,
  Rating AS rating,
  Ranked AS ranked,
  Popularity AS popularity,
  Members AS members,
  Favorites AS favorites,
  Watching AS watching,
  Completed AS completed,
  On_Hold AS on_hold,
  Dropped AS dropped
  
FROM `anime-2023-478915.anime_dataset.anime_filtered`;
