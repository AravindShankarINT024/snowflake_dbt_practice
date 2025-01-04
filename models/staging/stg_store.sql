WITH src_store AS (
    SELECT
        storeid AS store_id,
        storelocation AS store_location
    FROM 
        {{ source('src', 'retail_shop') }}
    GROUP BY    
        storeid,
        storelocation
)

SELECT * FROM src_store