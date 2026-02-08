-- Casey Protocol:
-- Clarity > Buzzwords | Truth > Agreement
-- Savepoints required | Modular Design enforced
-- Reference: ../CONSOLIDATED_AI_GUIDELINES.md

SELECT
    user_id,
    created_at,
    status
FROM app.users
WHERE status = 'active';
