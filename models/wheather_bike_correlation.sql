{{ config(materialized='table') }}

WITH CTE AS (

SELECT
t.*,
w.*
FROM
{{ ref('trip_fact') }} t
left join({{ ref('daily_weather') }}) w
on t.TRIP_DATE = w.daily_weather

)
SELECT * FROM CTE