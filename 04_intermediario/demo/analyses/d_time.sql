{{ config(materialized='table') }}

with cleaned_d_time as(
	select
		time_id,
		action_timestamp::timestamp
	from {{ source('transactional', 'd_time')}} 
)

select
  time_id,
  action_timestamp,
  date_part('year', action_timestamp) as action_year,
  date_part('month', action_timestamp) as action_month,
  date_part('week', action_timestamp) as action_week,
  --date_part('dow', action_timestamp) as action_weekday,
  to_char(action_timestamp, 'Day') as action_weekday,
  date_part('day', action_timestamp) as action_day
FROM cleaned_d_time