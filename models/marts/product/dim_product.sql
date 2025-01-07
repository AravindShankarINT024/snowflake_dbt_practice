{{
    config(
        materialized='incremental',
        unique_key= 'product_key'
    )
}}

WITH stg_product AS (
    SELECT
        product_key,
        product_category,
        CURRENT_USER() AS created_by,
        CURRENT_TIMESTAMP() AS created_date,
        NULL AS updated_by,
        NULL AS updated_date
    FROM
        {{ ref('stg_product') }}
)

SELECT * FROM stg_product