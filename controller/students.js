const connection = require("../connection");
const cloudinary = require("cloudinary");
const gravatar = require("gravatar");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");
cloudinary.config({
  cloud_name: "vn-esports",
  api_key: 996178356223912,
  api_secret: "rC8_6QyIf1DIbokVgSYe0VLsJwQ",
});

module.exports.listStudents = (req, res, next) => {
  connection.query(`SELECT * FROM Student`, (error, documents) => {
    if (error) {
      return res.status(400).json({ success: false, error });
    } else
      return res.status(200).json({
        success: true,
        response: { counts: documents.length, data: documents },
      });
  });
};

module.exports.getStudent = (req, res, next) => {
  connection.query(
    `SELECT 
  Student.email,
  Student.avatarUrl,
  Student.dob,
  Account.username,
  Account.password
FROM
  Student
      INNER JOIN
  Account ON Student.account = Account.id
WHERE
  sid = ${req.params.sid};`,
    (error, document) => {
      if (error) {
        return res.status(400).json({ success: false, error });
      } else
        return res.status(200).json({
          success: true,
          data: document[0],
        });
    }
  );
};

// Transaction: Query 1: Add account . Query 2: Add student.
module.exports.addStudent = (req, res, next) => {
  connection.beginTransaction(async (error) => {
    var avatar = gravatar.url(
      req.body.email,
      { s: "100", r: "x", d: "retro" },
      true
    );
    var password = await bcrypt.hash(req.body.password, 10);

    if (error) return res.status(400).json({ success: false, error });
    connection.query(
      `SELECT @id:=MAX(id)+1 FROM Account;`,
      (error, results, fields) => {
        if (error)
          return connection.rollback(() => {
            return res
              .status(400)
              .json({ success: false, error, message: "Rollback" });
          });
        // console.log("Get the ID for account");
      }
    );
    connection.query(
      `INSERT INTO Account(id,username,password) VALUES (@id,"${req.body.username}","${password}");`,
      (error, results) => {
        if (error)
          return connection.rollback(() => {
            return res
              .status(400)
              .json({ success: false, error, message: "Rollback" });
          });
        // console.log("Create new account");
      }
    );

    connection.query(
      `INSERT INTO Student(account,email,avatarUrl,dob) VALUES (@id,"${req.body.email}","${avatar}","${req.body.dob}");
        `,
      (error, results) => {
        if (error)
          return connection.rollback(() => {
            return res
              .status(400)
              .json({ success: false, error, message: "Rollback" });
          });
        // console.log("Create profile...");
      }
    );

    connection.commit((error) => {
      if (error)
        return connection.rollback(() => {
          return res
            .status(400)
            .json({ success: false, error, message: "Rollback" });
        });
      //   console.log("Commit transaction");
      return res.status(200).json({ success: true });
    });
  });
};

module.exports.updateStudent = (req, res, next) => {};

module.exports.deleteStudent = (req, res, next) => {};

module.exports.loginStudent = async (req, res, next) => {
  connection.query(
    `SELECT * FROM Account WHERE username="${req.body.username}"`,
    (error, document) => {
      if (error) return res.status(400).json({ error });
      if (document.length === 0)
        return res.status(404).json({ success: false, message: "Not found" });
      else {
        bcrypt.compare(req.body.password, req.body.password, (error, done) => {
          if (error)
            return res
              .status(400)
              .json({ success: false, message: "Wrong password" });
        });
      }
      let token = jwt.sign(
        { id: document[0].id, username: document[0].username },
        "s3cr3t",
        {
          expiresIn: "1w",
        }
      );
      return res.status(200).json({ success: true, token: token });
    }
  );
};
