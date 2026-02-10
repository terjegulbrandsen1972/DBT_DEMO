{{ config(materialized='table') }}

WITH BIKE AS(

SELECT

ride_id ,
REPLACE(started_at,'"','') as started_at ,
REPLACE(ended_at,'"','') as ended_at ,
start_station_name ,
start_station_id ,
end_station_name ,
end_station_id ,
start_lat ,
start_lng ,
end_lat ,
end_lng ,
member_casual

FROM {{ source('demo', 'BIKE') }}

WHERE ride_id !='"bikeid"' and started_at !='"starttime"' and started_at !='starttime'
)


SELECT * FROM BIKE