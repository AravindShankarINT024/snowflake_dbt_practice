WITH snapshot_data AS (
    SELECT 
        *
    FROM    
        {{ ref('customers_snapshot') }}
)

SELECT  
    customer_id,
    name,
    status
FROM    
    snapshot_data
WHERE
    dbt_valid_to IS NULL
