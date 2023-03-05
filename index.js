// const { Client } = require("pg");
// // Client для node, (підключення до DB через node)

// const config = {
//   host: "localhost",
//   port: 5432,
//   user: "postgres",
//   password: "postgres",
//   database: "pg_client",
// };

// const client = new Client(config);
// start();

// async function start() {
//   await client.connect();
//   const res = await client.query(`
//     CREATE TABLE "test_js"(
//         "id" serial PRIMARY KEY);
//     `);
//     console.log(res);
//   await client.end();
// }



const { Client } = require("pg");
const config = {
  host: "localhost",
  port: 5432,
  user: "postgres",
  password: "postgres",
  database: "pg_client",
};
const client = new Client(config);
start();
async function start() {
  await client.connect();
  const res = await client.query(``)
  console.log(res);
  await client.end();
}
