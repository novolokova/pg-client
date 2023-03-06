SELECT * from "users";

SELECT "firstName","lastName", "email", "isMale"  from "users";


SELECT "firstName","lastName", "email", "isMale"  FROM "users"
WHERE "isMale"=true;


SELECT *  FROM "users"
WHERE "id"%2=0;


SELECT "firstName","lastName", "id", "isMale"  
FROM "users"
WHERE "isMale"=true AND "id"%2=1;


SELECT "id", "firstName","lastName", "isMale"  
FROM "users"
WHERE "firstName"='Danilo';


SELECT "id", "firstName","lastName", "isMale"  
FROM "users"
WHERE "firstName" IN ('Danilo', 'Mariano', 'Yan', 'Tom');


SELECT "id", "firstName","lastName", "isMale"  
FROM "users"
WHERE "id" >15 AND "id"<30;

SELECT "id", "firstName","lastName", "isMale"  
FROM "users"
WHERE "id" BETWEEN 15 AND 30;

SELECT "id", "firstName","lastName", "isMale", "height" 
FROM "users"
WHERE  "isMale"=true AND "height"> 1.75;

SELECT "id", "firstName","lastName", "isMale", "height" 
FROM "users"
WHERE  "isMale"=true AND "height" BETWEEN 1.65 AND 1.95;


SELECT  "firstName","isMale", extract("years" from age("birthday"))
FROM "users";

SELECT  "firstName","isMale", extract("years" from age("birthday"))
FROM "users"
WHERE extract("years" from age("birthday"))=55;


SELECT  "firstName","isMale", "birthday"
FROM "users"
WHERE  age("birthday")<make_interval(25);


SELECT  "firstName","isMale", "birthday"
FROM "users"
WHERE  age("birthday")BETWEEN make_interval(25) AND make_interval(35);

-- дістати усіх повнолітніх жінок
-- дістати усіх повнолітніх чоловіків зі зростом більше 1.85
-- дістати пошту усіх чоловіків за 50
-- дістати усіх юзерів, які народилися 13 числа
-- дістати усіх юзерів, які народилися у березні
-- дістати email усіх Alex або John


-- дістати усіх повнолітніх жінок
SELECT *
FROM "users"
WHERE "isMale"=false AND extract("years" from age("birthday"))>=18;


-- дістати усіх повнолітніх чоловіків зі зростом більше 1.85

SELECT *
FROM "users"
WHERE "isMale"=true AND extract("years" from age("birthday"))>=18 AND "height"> 1.85;

-- дістати пошту усіх чоловіків за 50

SELECT "email"
FROM "users"
WHERE "isMale"=true AND extract("years" from age("birthday"))>50;


--  дістати усіх юзерів, які народилися 13 числа
SELECT *
FROM "users"
WHERE extract("years" from age("birthday"))=55;


-- дістати email усіх Alex або John

SELECT "firstName", "birthday" FROM "users"
WHERE extract("day" FROM ("birthday"))=13;

-- дістати усіх юзерів, які народилися у березні

SELECT "firstName", "birthday" FROM "users"
WHERE extract("month" FROM "birthday")=3;

-- дістати email усіх Alex або John
SELECT "firstName", "email"  FROM "users"
WHERE "firstName" IN ('Alex', 'Danilo');


SELECT "id", "firstName", "email"
FROM "users"
LIMIT 2 OFFSET 0;

SELECT "id", "firstName", "email" AS "пошта"
FROM "users"
LIMIT 2 OFFSET 0;



SELECT "id", "firstName"|| ' ' ||"lastName" AS "fullName"
FROM "users"
LIMIT 2 OFFSET 0;

SELECT "id", concat("firstName",' ',"lastName") AS "fullName"
FROM "users"
LIMIT 2 OFFSET 0;


SELECT "id", concat("firstName",' ',"lastName") AS "fullName", length(concat("firstName",' ',"lastName"))
FROM "users"
WHERE length(concat("firstName",' ',"lastName"))<=8;



--знайти пошту усіх чоловіків у яких fullName в діапазоні від 10 до 15 символів
SELECT "email", concat("firstName", ' ',"lastName") AS "fullName", length(concat("firstName", ' ',"lastName"))  FROM "users"
WHERE length(concat("firstName", ' ',"lastName"))BETWEEN 10 AND 15
AND "isMale"=true;



SELECT *
FROM
(
  SELECT "id", concat("firstName",' ',"lastName") AS "fullName", length(concat("firstName",' ',"lastName")) AS "length"
  FROM "users"
) AS "LENGTH_FN"