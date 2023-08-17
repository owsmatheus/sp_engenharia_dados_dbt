{{ config(
    materialized='table',
    tags=['painel_contas']
) }}
SELECT * FROM {{ source('mysql_raw', 'customers') }}