-- 01_anime_general.sql
-- Purpose:
-- Build the cleaned general anime table by selecting core metadata and
-- extracting a valid start_year from messy Aired strings (single dates
-- and date ranges). Also normalizes numeric fields and standardizes naming.

CREATE OR REPLACE TABLE `anime-2023-478915.anime_dataset.anime_general_cleaned` AS

SELECT
  anime_id,
  title,
  user_id,
  username,
  my_score,
  score,
  scored_by,
  popularity,
  SAFE_CAST(rank AS INT64) AS rank,
  genre,
  type,
  source,
  EXTRACT(
  YEAR FROM
  SAFE.PARSE_DATE(
    '%b %e, %Y',
    REGEXP_EXTRACT(Aired, r'^([A-Za-z]{3} \d{1,2}, \d{4})')
  )
) AS start_year
,
  Licensors AS licensors,
  Studios AS studios,
  Duration AS duration,
  Rating AS rating,

FROM `anime-2023-478915.anime_dataset.anime_general`;
