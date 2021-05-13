const mysql = require("mysql");

const connection = mysql.createConnection({
  host: "203.171.21.65",
  user: "root",
  password: "Passw@rd123",
  database: "hstudy",
  multipleStatements: true
});

connection.connect(err => {
  if (err) console.log(err.stack);
  console.log("Connected as " + connection.threadId);
});

module.exports = connection;
