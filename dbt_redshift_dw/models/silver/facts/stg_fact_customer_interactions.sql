{{
    config (
        materialized = 'incremental',
        alias = 'stg_fact_customer_interactions',
        schema = var('silver_schema'),
        unique_key = 'interaction_id',
        incremental_strategy = 'delete+insert',
        primary_key = 'interaction_id',
        distribution = 'even'
    )
}}

