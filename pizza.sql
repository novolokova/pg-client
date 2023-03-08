DROP TABLE IF EXISTS "pizza";

CREATE TABLE "pizza"(
    "id" bigserial PRIMARY KEY,
    "name" varchar(256) NOT NULL CHECK("name" != ''),
    "price" numeric(5,2) NOT NULL CHECK("price" > 0),
    "diameter" smallint NOT NULL CHECK("diameter" > 0)
);
-- Завдання на INSERT

INSERT INTO "pizza"("name", "diameter", "price") 
VALUES
('Маргарита', 18, 50.4);

INSERT INTO "pizza"("name", "diameter", "price") 
VALUES
('Карбонара', 28, 81);

INSERT INTO "pizza"("name", "diameter", "price") 
VALUES
('Цезар', 38, 149),
('Пепероні', 32, 116);

-- Завдання на UPDATE

UPDATE "pizza"
SET "price" = 53
WHERE "name"= 'Маргарита';

UPDATE "pizza"
SET "diameter" = 30
WHERE "id" = 4
--  поверніть усі оновлені данні ??? 
RETURNING "diameter";

UPDATE "pizza"
SET "price" = 130
WHERE "price" > 100
--  поверніть усі оновлені данні ??? 
RETURNING *;

UPDATE "pizza"
SET "diameter" = 22
WHERE "id" > 2 AND  "id" <=5;

UPDATE "pizza"
SET "price" = 180, "name"= '4 сири'
WHERE "name" = 'Цезар';


-- Завдання на SELECT

SELECT * 
FROM "pizza"
WHERE "id" = 3;

SELECT * 
FROM "pizza"
WHERE "price" < 100;

SELECT * 
FROM "pizza"
WHERE "price" != 130;

SELECT "price", "diameter"
FROM "pizza" 
WHERE "name" = 'Пепероні';

SELECT * 
FROM "pizza"
WHERE "name" = 'Маргарита';

SELECT * 
FROM "pizza"
WHERE "name" != 'Карбонара';

SELECT * 
FROM "pizza"
WHERE "diameter" = 22 AND "price" < 150;

SELECT * 
FROM "pizza"
WHERE ("diameter" > 25 AND "diameter" < 33) AND "price" > 100 AND "price" < 200;

SELECT * 
FROM "pizza"
WHERE "diameter" = 22 OR "price" = 180;


-- Завдання на DELETE

DELETE FROM "pizza"
WHERE "id" = 3; 

DELETE FROM "pizza"
WHERE "name" = 'Пепероні'
RETURNING *;

DELETE FROM "pizza"
WHERE "diameter" = 18
RETURNING *;
















