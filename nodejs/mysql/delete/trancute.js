import mysql from "../db.js";

try {
  const conn = await mysql.getConnection();
  conn.release();
  const column = await conn.query(`TRUNCATE TABLE users;`);
  console.log("All Rows Deleted");
} catch (error) {
  console.log(error);
}
