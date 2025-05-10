{{
    config (
        materialized = 'view',
        alias = 'fact_customer_interaction',
        schema = var('gold_schema'),
        unique_key = 'interaction_id',
        incremental_strategy = 'delete+insert',
        primary_key = 'interaction_id',
        distribution = 'even'
    )
}}

WITH source_data AS (
    SELECT
        interaction_id,
        date_id,
        channel_id,
        location_id,
        customer_id,
        interaction_type,
        interaction_rating
        FROM {{ref('stg_fact_customer_interactions')}}
)

SELECT

FROM source_data s
INNER JOIN {{ref('dim_date')}} as d on s.date_id = d.date_id
INNER JOIN {{ref('dim_customer')}} as d on s.date_id = d.date_id
INNER JOIN {{ref('dim_location')}} as d on s.date_id = d.date_id
INNER JOIN {{ref('dim_channel')}} as d on s.date_id = d.date_id