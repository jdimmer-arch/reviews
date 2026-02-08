-- Casey Protocol:
-- Follow dbt best practices + Casey Guidelines
-- Savepoints enforced | Modular CTE structure
-- Reference: ../CONSOLIDATED_AI_GUIDELINES.md

{{ config(materialized='incremental') }}

WITH base AS (
    SELECT * FROM {{ source('app', 'users') }}
)
SELECT
    user_id,
    created_at,
    status
FROM base
{% if is_incremental() %}
WHERE created_at > (SELECT MAX(created_at) FROM {{ this }})
{% endif %}
