-- Improve fetching previous user results (history and latest per photo).
CREATE INDEX IF NOT EXISTS idx_results_user_created_at
    ON results (user_id, created_at DESC);

-- Migrate primary key from integer result_id to UUID id.
CREATE EXTENSION IF NOT EXISTS "pgcrypto";

ALTER TABLE results
    ADD COLUMN IF NOT EXISTS id UUID;

UPDATE results
SET id = gen_random_uuid()
WHERE id IS NULL;

ALTER TABLE results
    ALTER COLUMN id SET NOT NULL,
    ALTER COLUMN id SET DEFAULT gen_random_uuid();

ALTER TABLE results
    DROP CONSTRAINT IF EXISTS results_pkey;

ALTER TABLE results
    ADD CONSTRAINT results_pkey PRIMARY KEY (id);

ALTER TABLE results
    DROP COLUMN IF EXISTS result_id;
