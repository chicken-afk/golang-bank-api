CREATE TABLE "accounts" (
  "id" BIGSERIAL PRIMARY KEY,
  "owner" varchar,
  "balance" bigint,
  "currency" varchar,
  "created_at" timestamptz DEFAULT (now()),
  "country_code" int
);

CREATE TABLE "entries" (
  "id" bigSerial PRIMARY KEY,
  "account_id" bigint,
  "amount" bigint,
  "created_at" timestamptz DEFAULT (now())
);

CREATE TABLE "transfers" (
  "id" bigSerial PRIMARY KEY,
  "from_account_id" bigint,
  "to_account_id" bigint,
  "amount" bigint,
  "created_at" timestamptz DEFAULT (now())
);

CREATE INDEX ON "entries" ("account_id");

CREATE INDEX ON "transfers" ("from_account_id");

CREATE INDEX ON "transfers" ("to_account_id");

CREATE INDEX ON "transfers" ("from_account_id", "to_account_id");

ALTER TABLE "entries" ADD FOREIGN KEY ("account_id") REFERENCES "accounts" ("id");

ALTER TABLE "transfers" ADD FOREIGN KEY ("from_account_id") REFERENCES "accounts" ("id");

ALTER TABLE "transfers" ADD FOREIGN KEY ("to_account_id") REFERENCES "accounts" ("id");