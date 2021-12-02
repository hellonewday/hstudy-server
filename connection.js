const mysql = require("mysql");
const os = require("os");


const connection = mysql.createConnection({
  host: os.platform() == "win32" ? "localhost" : "203.171.21.65",
  user: "root",
  password: os.platform() == "win32" ? "1234" : "Passw@rd123",
  database: "hstudy",
  connectTimeout: 60000,
  multipleStatements: true
});

connection.connect(err => {
  if (err) console.log(err.stack);
  console.log("Connected as " + connection.threadId);
});

module.exports = connection;
