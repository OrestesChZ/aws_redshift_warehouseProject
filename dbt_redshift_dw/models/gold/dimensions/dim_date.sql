{{
    config (
        materialized = 'incremental',
        alias = 'stg_dim_date',
        schema = 'date_id',
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
    getdate() as created_at
 FROM
    {{var('bronze_schema')}}.ext_dates