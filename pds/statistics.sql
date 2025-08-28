-- Your SQL goes here

-- Create Refresh Token Table
CREATE TABLE IF NOT EXISTS pds.access_token (
    did character varying PRIMARY KEY,
    "expiresAt" character varying NOT NULL,
    "nextId" character varying,
    "appPasswordName" character varying
);

ALTER TABLE pds.refresh_token
    ADD COLUMN "loginTimes" integer;