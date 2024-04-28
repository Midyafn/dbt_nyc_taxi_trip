{{ config(materialized='table') }}

SELECT
  EXTRACT(YEAR FROM lpep_pickup_datetime) AS year,
  EXTRACT(MONTH FROM lpep_pickup_datetime) AS month,
  SUM(passenger_count) AS passenger_count
FROM
  {{ source('raw', 'nyc_taxi_trip')}}
GROUP BY
  year,
  month
ORDER BY
  year,
  month
