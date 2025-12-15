with 
cte as (
select 
    started_at::timestamp as started_at,
    started_at::date as date_started_at,
    hour(started_at::timestamp) as hour_started_at,
    dayname(started_at::timestamp) as day_name,
    case
        when day_name in ('Sat', 'Sun')
        then 'WEEKEND'
        else 'WEEKDAY'
    end as day_type,
    /*
    case
        when month(started_at::timestamp) in (12,1,2)
        then 'WINTER'
        when month(started_at::timestamp) in (3,4,5)
        then 'SPRING'
        when month(started_at::timestamp) in (6,7,8)
        then 'SUMMER'
        else 'AUTUMN'
    end as station_of_year,
    */
    {{ get_season('started_at') }} as station_of_year
    
from {{ source('demo', 'bike') }}
)

select *
from cte