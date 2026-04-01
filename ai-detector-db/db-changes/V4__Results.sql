CREATE TABLE IF NOT EXISTS results
(
    result_id   SERIAL PRIMARY KEY,
    photo_id    UUID NOT NULL,
    user_id     UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    model       VARCHAR(50) NOT NULL,
    chance      NUMERIC(4, 2) NOT NULL,-- -99,99 to +99,99. Should be ok for majority of ways AI team can return the chance.
    created_at TIMESTAMP DEFAULT NOW() NOT NULL,
    is_deleted BOOLEAN DEFAULT FALSE
);