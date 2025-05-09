{{
    config (
        materialized = 'incremental',
        alias = 'stg_dim_currency',
        schema = 'currency_id',
        incremental_strategy = 'delete+insert'
    )
}}

SELECT
    currency_id,
    name,
    iso3_code,
    getdate() as created_at
 FROM
    {{var('bronze_schema')}}.ext_currencies