{{ config(materialized='table') }}

WITH BIKE as (

select
DISTINCT 
START_STATION_ID as station_id,
START_STATION_NAME as station_name,
START_LAT as station_lat,
START_LNG as station_lng

from
{{ ref('stg_bike') }}


)
select * from BIKE