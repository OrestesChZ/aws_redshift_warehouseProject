{{
    config (
        materialized = 'incremental',
        alias = 'dim_date',
        schema = var('gold_schema'),
        unique_key = 'date_id',
        incremental_strategy = 'delete+insert'
    )
}}

SELECT
    date_id,
    date,
    day,
    month,
    year,
    quarter,
    weekday,
    created_at
 FROM
    {{ref ('stg_dim_date')}}