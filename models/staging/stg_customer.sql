WITH src_customer AS (
    SELECT
        customerid,
        age,
        gender,
        annualincome
    FROM 
        src.retail_shop
    GROUP BY
        customerid,
        age,
        gender,
        annualincome
)


SELECT * FROM src_customer