{{ config(materialized='table') }}

SELECT
  RatecodeID,
  {{ year_extract('lpep_pickup_datetime') }} AS year,
  {{ month_extract('lpep_pickup_datetime') }} AS month,
  SUM(trip_distance) AS total_trip_distance
FROM
  {{ source('raw', 'nyc_taxi_trip')}}
GROUP BY
  year,
  month,
  RatecodeID
ORDER BY
  year,
  month,
  RatecodeID

