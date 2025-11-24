-- 01_anime_enriched_base.sql
-- Purpose:
-- Build the base enriched anime table by joining user-level ratings from `final`
-- with cleaned metadata from `anime_filtered`. This is the starting point for
-- all further analysis (EDA, modeling, etc.).

SELECT 
  f.username,
  f.anime_id,
  f.my_score,
  f.user_id,
  f.gender,
  f.title,
  f.type,
  f.source,
  f.score,
  f.scored_by,
  f.rank,
  f.popularity,
  f.genre,
  ft.Aired,
  ft.Licensors,
  ft.Studios,
  ft.Source,
  ft.Duration,
  ft.Rating
  
FROM `anime-2023-478915.anime_dataset.final` f
INNER JOIN `anime-2023-478915.anime_dataset.anime_filtered` ft
  ON ft.anime_id = f.anime_id
