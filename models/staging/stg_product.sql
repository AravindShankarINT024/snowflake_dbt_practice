WITH src_product AS (
    SELECT
        productcategory AS product_category
    FROM
        {{ source('src', 'retail_shop') }}
    GROUP BY    
        productcategory
)

SELECT * FROM src_product