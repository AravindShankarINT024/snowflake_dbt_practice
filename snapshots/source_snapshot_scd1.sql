{% snapshot source_snapshot_scd1 %}
    {{
        config(
            target_schema='dbt_asivanathan',
            target_database='test1',
            unique_key='id',
            strategy='timestamp',
            updated_at='updated_at',
        )
    }}

    select * from dbt_asivanathan.source_table
 {% endsnapshot %}