{{
    config (
        materialized = 'incremental',
        alias = 'stg_dim_location',
        schema = 'location_id',
        incremental_strategy = 'delete+insert'
    )
}}

SELECT
    location_id,
    city,
    state,
    country,
    address,
    getdate() as created_at
 FROM
    {{var('bronze_schema')}}.ext_locations