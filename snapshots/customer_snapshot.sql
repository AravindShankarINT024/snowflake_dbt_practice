{% snapshot customer_snapshot %}
    {{
        config(
            target_schema='snapshot',
            target_database='retail_shop',
            unique_key='customer_id',
            strategy='check',
            check_cols=['age', 'annual_income']
        )
    }}

    select * from {{ ref('stg_customer') }}
 {% endsnapshot %}