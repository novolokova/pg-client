DROP TABLE IF EXISTS "users";
CREATE TABLE "users"(
  "id" bigserial PRIMARY KEY,
  "firstName" varchar(64) NOT NULL CHECK ("firstName" != ''),
  "lastName" varchar(64) NOT NULL CHECK ("lastName" != ''),
  "email" varchar(256) NOT NULL CHECK ("email" != '') UNIQUE,
  "isMale" boolean NOT NULL,
  "birthday" date NOT NULL CHECK (
    "birthday" < current_date
    AND age("birthday") <= make_interval(150)
  ),
  "height" numeric(3, 2) NOT NULL CHECK (
    "height" > 0.40
    AND "height" < 2.50
  )
);

ALTER TABLE "users" 
ADD COLUMN "weight" int CHECK ("weight">0 AND "weight"<=250);

