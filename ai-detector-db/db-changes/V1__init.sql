CREATE TABLE IF NOT EXISTS users
(
    id        SERIAL PRIMARY KEY, --todo later make this a UUID or another nice id
    login     VARCHAR(50),
    password  VARCHAR(64),
    email     VARCHAR(50),
    is_deleted BOOLEAN DEFAULT FALSE
);
