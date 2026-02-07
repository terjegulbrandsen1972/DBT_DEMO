{% macro get_season(x) %}

CASE WHEN
MONTH(TO_TIMESTAMP({{x}})) in (1,2,3)
THEN 'Winter'
WHEN MONTH(TO_TIMESTAMP({{x}})) in (4,5,6)
THEN 'Spring'
WHEN MONTH(TO_TIMESTAMP({{x}})) in (7,8,9)
THEN 'Summer'
WHEN MONTH(TO_TIMESTAMP({{x}})) in (10,11,12)
THEN 'Autumn'
END

{% endmacro %}



{% macro get_daytype(x) %}

CASE WHEN
DAYNAME(TO_TIMESTAMP(STARTED_AT)) IN('Sat','Sun')
THEN 'Weekend'
ELSE 'Businessday' 
END

{% endmacro %}