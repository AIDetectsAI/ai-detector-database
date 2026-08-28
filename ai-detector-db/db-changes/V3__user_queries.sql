CREATE TABLE
    IF NOT EXISTS user_queries (
        id UUID PRIMARY KEY,
        user_id UUID NOT NULL,
        image_path TEXT NOT NULL,
        timestamp TIMESTAMP NOT NULL,
        result BOOLEAN NOT NULL,
        CONSTRAINT fk_user_queries_user FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE
    );