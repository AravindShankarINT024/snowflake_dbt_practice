WITH src_payment AS (
    SELECT
        paymentmethod AS payment_method
    FROM
        {{ source('src', 'retail_shop') }}
    GROUP BY    
        paymentmethod
)

SELECT * FROM src_payment