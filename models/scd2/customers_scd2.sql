WITH snapshot_data AS (
  SELECT
    *
  FROM {{ ref('customers_snapshot') }}
)

SELECT
  customer_id,
  name,
  status,
  -- Only the latest row will be marked as current
  CASE
    WHEN dbt_valid_to IS NULL THEN TRUE
    ELSE FALSE
  END AS active_flag,
  dbt_scd_id,
  dbt_updated_at,
  dbt_valid_from,
  dbt_valid_to
FROM snapshot_data
