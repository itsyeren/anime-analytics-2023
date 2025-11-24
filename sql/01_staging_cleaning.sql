-- ============================================
-- 01_staging_cleaning.sql
-- BigQuery Staging & Initial Cleaning
-- Anime Analytics 2023 Project
-- ============================================
-- STAGING LAYER: stg_anime_2023
-- --------------------------------------------
-- This script creates the staging table from the
-- raw Anime 2023 dataset. Columns are standardized,
-- early type issues are handled, and basic structure
-- is prepared for further cleaning.
--
-- Text-based fields are kept as STRING due to mixed
-- formats (date ranges, multiple genres, unknowns).
-- Numeric fields that are safe to convert (Episodes)
-- are cast using SAFE_CAST to prevent load errors.
--
-- This staging table acts as the foundation for the
-- intermediate layer, where deeper cleaning and
-- type conversions will be performed.
-- ============================================

CREATE OR REPLACE TABLE `anime-2023-478915.anime_dataset.stg_anime_2023` AS

SELECT
  anime_id,
  Name AS name,
  Score AS score, 
  Genres AS genres,
  Type AS type,
  SAFE_CAST(Episodes AS INT64) AS episodes,
  Aired AS aired,
  Premiered AS premiered,
  Status AS status,
  Producers AS producers,
  Licensors AS licensors,
  Studios AS studios,
  Source AS source,
  Duration AS duration,
  Rating AS rating,
  Rank AS rank,
  Popularity AS popularity,
  Favorites AS favorites,
  Scored_By AS scored_by,
  Members AS members
FROM `anime-2023-478915.anime_dataset.anime_2023`;
