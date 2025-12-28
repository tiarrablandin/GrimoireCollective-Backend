-- Initial schema setup
-- This is a placeholder migration file
-- Add your database schema here

CREATE TABLE IF NOT EXISTS grimoire_metadata (
    id SERIAL PRIMARY KEY,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
