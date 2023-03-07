SELECT * FROM "users";

SELECT max( "weight") FROM "users";
SELECT min( "height") FROM "users";
SELECT avg( "height") FROM "users";
SELECT sum( "weight") FROM "users";
SELECT count( "weight") FROM "users";

SELECT sum( "weight"), "isMale" 
FROM "users"
GROUP BY "isMale" ;

SELECT count("id"), "isMale" ,"firstName"
FROM "users"
WHERE "isMale"=false
GROUP BY "isMale", "firstName"
LIMIT 5;


--кількість чоловіків та жінок
SELECT count("id"), "isMale" 
FROM "users"
GROUP BY "isMale";

--середній зріст  чоловіків та жінок
SELECT avg("height") AS "avg Height",  "isMale"
FROM "users"
GROUP BY "isMale";

--кількість людей, які народилися у 1982
SELECT count(*), extract("year" FROM "birthday") AS "year"
FROM "users"
WHERE extract("year" FROM "birthday")=1982
GROUP BY  extract("year" FROM "birthday");

--кількість і стать людей з прізвищем Pitt
SELECT count("id"), "isMale", "lastName"
FROM "users"
WHERE "lastName"='Pitt'
GROUP BY "isMale", "lastName";

--кількість людей, які народилися -- "day" "month"
SELECT count(*), extract ("day" from "birthday")AS "day",extract ("month" from "birthday") AS "month"
FROM "users"
WHERE extract ("day" from "birthday")=3 
AND  extract ("month" from "birthday")=9
GROUP BY extract ("day" from "birthday"),extract ("month" from "birthday");

--загальна вага всіх з іменем Maria
SELECT sum( "weight"), "firstName"
FROM "users"
WHERE "firstName"='Maria'
-- WHERE "firstName" IN ('Maria','Alex','Mary','Anna'
GROUP BY "firstName";

--загальна вага чоловіків зі зростом вище 1.95
SELECT sum( "weight"), "isMale" AS "male with height > 1.95"
FROM "users"
WHERE "height">1.95 AND "isMale"=true
GROUP BY "isMale";


--кількість жінок з однаковими прізвищами
SELECT count("id") "isMale", "lastName"
FROM "users"
WHERE "isMale"=false
GROUP BY "isMale", "lastName";


--кількість чоловіків, які народилися влітку
SELECT count(*) AS "amount summer male", "isMale"
FROM "users"
-- WHERE extract ("month" from "birthday") IN (6, 7, 8) AND "isMale"=true
WHERE (extract("month" FROM "birthday") BETWEEN 6 AND 8) AND "isMale"=true
GROUP BY "isMale";



--середня вага чоловіків 1975 року народження

SELECT avg("weight"), extract("year" FROM "birthday")AS "year", "isMale"
FROM "users"
WHERE extract("year" FROM "birthday")=1975 AND "isMale"=true
GROUP BY  extract("year" FROM "birthday"), "isMale";

