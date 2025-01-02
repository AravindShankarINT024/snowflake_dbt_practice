WITH snapshot_data AS (
    SELECT 
        *
    FROM    
        {{ ref('source_snapshot_scd1') }}
    WHERE
        dbt_valid_to IS NULL
)

SELECT  
    id,
    name,
    email,
    updated_at
FROM    
    snapshot_data

