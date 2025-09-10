-- Your SQL goes here
CREATE SCHEMA IF NOT EXISTS indexer;

CREATE TABLE IF NOT EXISTS indexer.did_record (
    "did" VARCHAR PRIMARY KEY,
    "ckbAddress" VARCHAR NOT NULL UNIQUE,
    "handle" VARCHAR NOT NULL UNIQUE,
    "txHash" VARCHAR NOT NULL,
    "txIndex" INT NOT NULL,
    "document" VARCHAR NOT NULL,
    "height" BIGINT NOT NULL,
    "createdAt" character varying NOT NULL,
    "valid" BOOLEAN NOT NULL
);

CREATE UNIQUE INDEX record_handle_lower_idx
    ON indexer.did_record (LOWER(handle));