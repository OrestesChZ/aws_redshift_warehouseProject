{{
    config (
        materialized = 'incremental',
        alias = 'stg_dim_transaction_type',
        schema = 'transaction_type_id',
        incremental_strategy = 'delete+insert'
    )
}}

SELECT
    interaction_id,
    date_id,
    account_id,
    channel_id,
    interaction_type,
    interaction_rating,
    getdate() as created_at
 FROM
    {{var('bronze_schema')}}.ext_transaction_types