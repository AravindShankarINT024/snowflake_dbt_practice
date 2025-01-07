{{
    config(
        materialized='incremental',
        incremental_strategy= 'delete+insert'
    )
}}

WITH stg_store AS (
    SELECT
        HASH(*) AS store_key,
        store_id,
        store_location,
        CURRENT_USER() AS created_by,
        CURRENT_TIMESTAMP() AS created_date,
        NULL AS updated_by,
        NULL AS updated_date
    FROM 
        {{ ref('stg_store') }}
)

SELECT * FROM stg_store