{{
    config (
        materialized = 'incremental',
        alias = 'dim_channel',
        schema = 'channel_id',
        incremental_strategy = 'delete+insert'
    )
}}

SELECT
    channel_id,
    channel_name,
    getdate() as created_at
 FROM
    {{ref ('stg_dim_channel')}}