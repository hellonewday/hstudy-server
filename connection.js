const mysql = require("mysql");
const os = require("os");


const connection = mysql.createPool({
  host: os.platform() == "win32" ? "localhost" : "203.171.21.65",
  user: "root",
  password: os.platform() == "win32" ? "1234" : "Passw@rd123",
  database: "hstudy",
  connectTimeout: 60000,
  multipleStatements: true,
  charset: 'utf8mb4'
});


module.exports = connection;
