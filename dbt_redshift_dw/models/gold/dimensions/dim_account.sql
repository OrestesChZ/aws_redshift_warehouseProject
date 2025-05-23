{{
    config (
        materialized = 'incremental',
        alias = 'dim_account',
        schema = var('gold_schema'),
        unique_key = 'account_id',
        incremental_strategy = 'delete+insert'
    )
}}

SELECT
    account_id,
    account_number,
    customer_id,
    account_type,
    account_balance,
    credit_score,
    created_at
 FROM
    {{ref ('stg_dim_account')}}