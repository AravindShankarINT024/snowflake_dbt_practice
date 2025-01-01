{% snapshot customers_snapshot %}
  {{
    config(
      target_schema='dbt_asivanathan',
      target_database='test1',
      unique_key='customer_id',
      strategy='check',
      check_cols=['name', 'status']
    )
  }}

  SELECT
    customer_id,
    name,
    status,
    CURRENT_TIMESTAMP AS load_date
  FROM dbt_asivanathan.customers

{% endsnapshot %}
