{{ config(
    materialized='table',
    tags=['dim']
)}}

{% set date_parts = ['year', 'month', 'week', 'day', 'dayofweek'] %}

select
  time_id,
  action_timestamp,
  {% for part in date_parts -%}
    EXTRACT({{ part | upper }} FROM action_timestamp) as action_{{part}},
  {% endfor -%}
  {#
  -- date_part('month', action_timestamp) as action_month,
  -- date_part('week', action_timestamp) as action_week,
  -- date_part('day', action_timestamp) as action_day
  -- date_part('dow', action_timestamp) as action_weekday,
  to_char(action_timestamp, 'Day') as action_weekday
  -#}
FROM {{ ref('cleaned_d_time') }}
{{ limit_lines_dev(environment='prod') }}