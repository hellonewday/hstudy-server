const mysql = require("mysql");
const os = require("os");


const connection = mysql.createPool({
  host: os.platform() == "linux" ? "192.168.0.145" : "94.74.99.84",
  user: "dev",
  password:"Vietnam@123",
  database: "blindpay",
  connectTimeout: 60000,
  multipleStatements: true,
  charset: 'utf8mb4'
});


module.exports = connection;
