{{
    config(
        materialized='incremental',
        unique_key = 'id',
        enabled=false
    )
}}

select *
from {{ref('tabela')}}
{% if is_incremental() %}
  where dia > (select max(dia) from {{ this }})
{% endif %}