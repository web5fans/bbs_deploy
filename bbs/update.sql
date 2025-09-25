ALTER TABLE post
    ADD COLUMN "edited" timestamptz;

ALTER TABLE reply
    ADD COLUMN "comment" varchar;