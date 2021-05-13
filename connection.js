const mysql = require("mysql");

const connection = mysql.createConnection({
  host: "db",
  user: "root",
  password: "root",
  database: "hstudy",
  multipleStatements: true
});

connection.connect(err => {
  if (err) console.log(err.stack);
  console.log("Connected as " + connection.threadId);
});

module.exports = connection;
