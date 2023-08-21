{{
    config(
        materialized='ephemeral'
    )
}}

select
    time_id,
    {% if target.type == 'postgres' -%}
        action_timestamp::timestamp
    {% elif target.type == 'bigquery' -%}
        timestamp(action_timestamp) 
    {%- else -%}
        action_timestamp
    {%- endif -%}
    as action_timestamp,
from {{ source('postgres', 'd_time') }} 