{% snapshot customer_snapshot %}
    {{
        config(
            target_schema='schema',
            target_database='database',
            unique_key='field',
            strategy='check',
            updated_at='updated_at_field',
        )
    }}

    select * from {{ ref('stg_customer') }}
 {% endsnapshot %}