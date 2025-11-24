-- 02_anime_website_details.sql
-- Purpose:
-- Extract key website-level performance metrics for each anime from the
-- cleaned dataset (`anime_filtered`). This table isolates engagement signals
-- such as members, favorites, and completion status for focused analysis.

CREATE OR REPLACE TABLE `anime-2023-478915.anime_dataset.anime_website_details` AS

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
