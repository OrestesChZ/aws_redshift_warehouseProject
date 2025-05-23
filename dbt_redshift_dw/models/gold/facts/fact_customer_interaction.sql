{{
    config (
        materialized = 'view',
        alias = 'fact_customer_interactions',
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
    s.date_id,
    s.interaction_id,
    d.date as interaction_date,
    s.customer_id,
    c.first_name,
    c.last_name,
    c.full_name,
    c.city,
    c.state,
    l.country,
    c.postal_code,
    s.channel_id,
    ch.channel_name,
    s.interaction_type,
    s.interaction_rating
FROM
    source_data s
INNER JOIN
    {{ ref('dim_date') }} as d ON s.date_id = d.date_id
INNER JOIN
    {{ ref('dim_customer') }} as c ON s.customer_id = c.customer_id
INNER JOIN
    {{ ref('dim_location') }} as l ON s.location_id = l.location_id
INNER JOIN
    {{ ref('dim_channel') }} as ch ON s.channel_id = ch.channel_id