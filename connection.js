const mysql = require("mysql");
const os = require("os");


const connection = mysql.createPool({
  host: os.platform() == "linux" ? "" : "",
  user: "",
  password:"",
  database: "",
  connectTimeout: 60000,
  multipleStatements: true,
  charset: 'utf8mb4'
});


module.exports = connection;
