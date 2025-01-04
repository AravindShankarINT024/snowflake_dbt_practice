WITH src_customer AS (
    SELECT
        customerid AS customer_id,
        age,
        gender,
        annualincome AS annual_income
    FROM 
        {{ source('src', 'retail_shop') }}
    GROUP BY
        customerid,
        age,
        gender,
        annualincome
)


SELECT * FROM src_customer