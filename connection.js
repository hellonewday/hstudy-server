const mysql = require("mysql");
const os = require("os");


const connection = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "1234",
  port: os.platform() == "win32" ? 3306 : 3307,
  database: "hstudy",
  connectTimeout: 60000,
  multipleStatements: true
});

connection.connect(err => {
  if (err) console.log(err.stack);
  console.log("Connected as " + connection.threadId);
});

module.exports = connection;
