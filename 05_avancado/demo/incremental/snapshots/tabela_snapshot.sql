{% snapshot tabela_snapshot %}

{{
    config(
      target_database='postgres',
      target_schema='snapshots',
      unique_key='id',

      strategy='timestamp',
      updated_at='dia',
    )
}}

select * from {{ ref('tabela') }}

{% endsnapshot %}