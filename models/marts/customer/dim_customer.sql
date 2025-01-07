{{
    config(
        materialized='incremental',
        unique_key= 'customer_key'
    )
}}

WITH stg_customer AS (
    SELECT
        customer_key,
        customer_id,
        age,
        gender,
        annual_income,
        CURRENT_USER() AS created_by,
        dbt_valid_from AS created_date,
        CASE 
            WHEN dbt_valid_to IS NOT NULL THEN CURRENT_USER()
            ELSE NULL
        END AS updated_by,
        dbt_valid_to AS updated_date,
        CASE 
            WHEN dbt_valid_to IS NULL THEN 'Y'
            ELSE 'N'
        END AS flag
    FROM    
        {{ ref('customer_snapshot') }}
)

SELECT * FROM stg_customer