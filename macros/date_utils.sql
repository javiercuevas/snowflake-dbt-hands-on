{% macro get_season(ts) %}
case
    when month({{ts}}::timestamp) in (12,1,2)
    then 'WINTER'
    when month({{ts}}::timestamp) in (3,4,5)
    then 'SPRING'
    when month({{ts}}::timestamp) in (6,7,8)
    then 'SUMMER'
    else 'AUTUMN'
end
{% endmacro %}