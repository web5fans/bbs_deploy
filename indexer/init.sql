-- Your SQL goes here
CREATE SCHEMA IF NOT EXISTS indexer;

CREATE TABLE IF NOT EXISTS indexer.did_record (
    "did" VARCHAR PRIMARY KEY,
    "ckbAddress" VARCHAR NOT NULL UNIQUE,
    "handle" VARCHAR NOT NULL,
    "signingKey" VARCHAR NOT NULL,
    "txHash" VARCHAR NOT NULL,
    "outIndex" INT NOT NULL,
    "document" VARCHAR NOT NULL,
    "height" BIGINT NOT NULL,
    "createdAt" character varying NOT NULL,
    "valid" BOOLEAN NOT NULL
);

CREATE INDEX record_handle_lower_idx ON indexer.did_record (LOWER(handle));

CREATE INDEX record_cursor_idx ON indexer.did_record ("txHash", "outIndex");

CREATE TABLE IF NOT EXISTS indexer.did_delete_record (
    "did" VARCHAR PRIMARY KEY,
    "ckbAddress" VARCHAR NOT NULL,
    "handle" VARCHAR NOT NULL,
    "signingKey" VARCHAR NOT NULL,
    "txHash" VARCHAR NOT NULL,
    "inIndex" INT NOT NULL,
    "document" VARCHAR NOT NULL,
    "height" BIGINT NOT NULL,
    "deletedAt" character varying NOT NULL
);

CREATE INDEX record_handle_lower_idx2 ON indexer.did_delete_record (LOWER(handle));
