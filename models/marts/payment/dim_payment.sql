{{
    config(
        materialized='incremental',
        incremental_strategy= 'delete+insert'
    )
}}

WITH stg_payment AS (
    SELECT
        HASH(*) AS payment_key,
        payment_method,
        CURRENT_USER() AS created_by,
        CURRENT_TIMESTAMP() AS created_date,
        NULL AS updated_by,
        NULL AS updated_date
    FROM
        {{ ref('stg_payment') }}
)

SELECT * FROM stg_payment