{{ config(materialized='table') }}

select
  c.city_id,
  c.state_id,
  s.country_id,
  c.city,
  s.state,
  co.country
FROM {{ source('transactional', 'city') }} c
  left join {{ source('transactional', 'state') }} s
    on s.state_id = c.state_id
  left join {{ source('transactional', 'country') }} co
    on co.country_id = s.country_id