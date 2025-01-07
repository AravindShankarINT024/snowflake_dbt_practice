WITH src_product AS (
    SELECT
        DISTINCT
        MD5(productcategory) AS product_key,
        productcategory AS product_category
    FROM
        {{ source('src', 'retail_shop') }}
)

SELECT * FROM src_product