ALTER TABLE users
    ALTER COLUMN password DROP NOT NULL;

ALTER TABLE users
    ALTER COLUMN email SET NOT NULL;

ALTER TABLE users
    ADD COLUMN provider VARCHAR(50) NOT NULL,
    ADD COLUMN provider_user_id VARCHAR(100),
    ADD COLUMN last_login_at TIMESTAMP,
    ADD COLUMN created_at TIMESTAMP DEFAULT NOW() NOT NULL,
    ADD COLUMN updated_at TIMESTAMP DEFAULT NOW() NOT NULL;

ALTER TABLE users
    ADD CONSTRAINT users_provider_uid_unique UNIQUE (provider, provider_user_id);

ALTER TABLE users
    ADD CONSTRAINT provider_user_id_required CHECK (
        (provider = 'AiDetectsAi' AND provider_user_id IS NULL)
            OR (provider <> 'AiDetectsAi' AND provider_user_id IS NOT NULL)
        );

CREATE TABLE IF NOT EXISTS roles
(
    id
    SERIAL
    PRIMARY
    KEY,
    name
    VARCHAR
(
    50
) UNIQUE NOT NULL);

INSERT INTO roles (name)
VALUES ('USER'),
       ('ADMIN') ON CONFLICT (name) DO NOTHING;

CREATE TABLE IF NOT EXISTS user_roles
(
    user_id
    UUID
    NOT
    NULL
    REFERENCES
    users
(
    id
) ON DELETE CASCADE,
    role_id INT NOT NULL REFERENCES roles
(
    id
)
  ON DELETE CASCADE,
    PRIMARY KEY
(
    user_id,
    role_id
)
    );
