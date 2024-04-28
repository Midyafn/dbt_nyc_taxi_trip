-- to test whether there are one or more row, that contains NULL value on all this data
-- if there is one or more row that contains ALL of this row NULL, test will be fail
-- if there is none row with all of this row has NULL values, it will complete

SELECT
  *
FROM
  {{ source('raw', 'nyc_taxi_trip')}}

WHERE (total_amount IS NULL AND 
    lpep_pickup_datetime IS NULL AND
    lpep_dropoff_datetime IS NULL AND
    passenger_count IS NULL AND
    RatecodeID IS NULL AND
    PULocationID IS NULL AND
    DOLocationID IS NULL AND
    payment_type IS NULL AND
    trip_type IS NULL AND
    VendorID IS NULL AND
    store_and_fwd_flag IS NULL AND
    fare_amount IS NULL AND
    trip_distance IS NULL)


