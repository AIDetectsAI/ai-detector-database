CREATE TABLE IF NOT EXISTS users
(
    id        SERIAL PRIMARY KEY,
    login     VARCHAR(50),
    password  VARCHAR(64),
    email     VARCHAR(50),
    is_deleted BOOLEAN DEFAULT FALSE
);
