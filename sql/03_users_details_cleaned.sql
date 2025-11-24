-- 03_users_details_cleaned.sql
-- Purpose:
-- Clean and standardize user-level profile data. Fix date formats, normalize
-- column names, and safely cast activity metrics to numeric types.

CREATE OR REPLACE TABLE `anime-2023-478915.anime_dataset.users_details_cleaned` AS
SELECT
  Username AS username,
  Gender AS gender,
  DATE(Birthday) AS date_of_birth,
  Location AS location,
  DATE(Joined) AS date_of_join,

  SAFE_CAST(`Days Watched`     AS INT64) AS days_watched,
  SAFE_CAST(Completed          AS INT64) AS completed,
  SAFE_CAST(Dropped            AS INT64) AS dropped,
  SAFE_CAST(`On Hold`          AS INT64) AS on_hold,
  SAFE_CAST(`Plan to Watch`    AS INT64) AS in_watchlist,
  SAFE_CAST(`Total Entries`    AS INT64) AS total_entries,
  SAFE_CAST(Rewatched          AS INT64) AS rewatched,
  SAFE_CAST(`Episodes Watched` AS INT64) AS episodes_watched

FROM `anime-2023-478915.anime_dataset.users_details`;
