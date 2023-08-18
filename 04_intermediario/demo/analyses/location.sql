{{ config(materialized='table',
    enable=false) }}

select
  c.city_id,
  c.state_id,
  s.country_id,
  c.city,
  s.state,
  co.country
FROM city c
  left join state s
    on s.state_id = c.state_id
  left join country co
    on co.country_id = s.country_id