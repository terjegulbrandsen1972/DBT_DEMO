{{ config(materialized='table') }}

WITH daily_weather as (

select
DATE(TIME) as daily_weather,
WEATHER,
TEMP,
PRESSURE,
HUMIDITY,
CLOUDS

  from
{{ source('demo', 'WEATHER') }}

--limit 100

),

daily_weather_agg as (
select 
daily_weather,
weather, 
round(avg(TEMP),2) as avg_temp,
round(avg(PRESSURE),2) as avg_pressure,
round(avg(HUMIDITY),2) as avg_humidity,
round(avg(CLOUDS),2) as avg_clouds
--count(weather) --brukes først i demo, men ikke etter partition by

--row_number() over (partition by daily_weather order by count(weather) desc) as row_number --brukes for synlighet først, deretter fjernes etter bruk  av qualify

from daily_weather
group by daily_weather,weather

qualify row_number() over (partition by daily_weather order by count(weather) desc) = 1
)

select * from daily_weather_agg
order by daily_weather