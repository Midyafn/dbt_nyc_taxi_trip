{{ config(materialized='table') }}

WITH month_total AS(
  SELECT
  payment_type,
  {{ year_extract('lpep_pickup_datetime') }} AS year,
  {{ month_extract('lpep_pickup_datetime') }} AS month,
  COUNT(*) AS transaction_count,
  SUM(total_amount) AS total_transactions
  FROM
    {{ source('raw', 'nyc_taxi_trip')}}
  GROUP BY 
    year,
    month,
    payment_type
  ORDER BY
    year,
    month,
    payment_type
)

SELECT 
  payment_type,
  year, 
  month,
  transaction_count,
  total_transactions, 
  {{ convert_idr('total_transactions') }} AS convert_to_idr

FROM 
  month_total

ORDER BY
  year,
  month,
  payment_type ASC
