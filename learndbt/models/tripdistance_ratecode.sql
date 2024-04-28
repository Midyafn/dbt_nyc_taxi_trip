{{ config(materialized='table') }}

SELECT
  RatecodeID,
  EXTRACT(YEAR FROM lpep_pickup_datetime) AS year,
  EXTRACT(MONTH FROM lpep_pickup_datetime) AS month,
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

