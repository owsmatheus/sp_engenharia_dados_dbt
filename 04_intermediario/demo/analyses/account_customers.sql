{{ config(materialized='table') }}

select
  a.account_id,
  a.customer_id,
  c.customer_city as city_id,
  a.created_at    as account_created_at,
  a.status        as account_status,
  a.account_branch,
  a.account_check_digit,
  a.account_number,
  c.first_name    as customer_first_name,
  c.last_name     as customer_last_name,
  c.cpf           as customer_cpf
from {{ source('transactional', 'accounts')}} a
  left join {{ source('transactional', 'customers')}} c
    on c.customer_id = a.customer_id