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
  connection.query(`SELECT * FROM student`, (error, documents) => {
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
  student.email,
  student.avatarUrl,
  student.dob,
  student.f_lang,
  student.p_lang,
  student.fullName,
  account.username
FROM
  student
      INNER JOIN
  account ON student.account = account.id
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
      `INSERT INTO account(id,username,password) VALUES (@id,"${req.body.username}","${password}");`,
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
      `INSERT INTO student(account,email,avatarUrl,dob) VALUES (@id,"${req.body.email}","${avatar}","${req.body.dob}");
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

module.exports.updateStudent = (req, res, next) => {
  connection.beginTransaction(async (error) => {
    if (error) return res.status(400).json({ success: false, error });
    var data = {};
    connection.query(
      `SELECT account.username, student.email, student.dob, student.avatarUrl, student.f_lang, student.p_lang, student.fullName FROM student INNER JOIN account ON student.account = account.id WHERE sid = ${req.params.id};`,
      (error, results, fields) => {
        if (error)
          return connection.rollback(() => {
            return res
              .status(400)
              .json({ success: false, error, message: "Rollback" });
          });
        console.log("Get the ID for account");
        data = results[0];
      }
    );

    connection.query(
      `UPDATE account
      SET username = "${req.body.username ? req.body.username : data.username}"
      WHERE id = ${req.params.id};`,
      (error, results) => {
        if (error)
          return connection.rollback(() => {
            return res
              .status(400)
              .json({ success: false, error, message: "Rollback" });
          });
        console.log("Update new account");
      }
    );

    connection.query(
      `UPDATE student
      SET dob = "${
        req.body.dob ? req.body.dob : data.dob.split("T")[0]
      }", email = "${
        req.body.email ? req.body.email : data.email
      }", f_lang = "${
        req.body.f_lang ? req.body.f_lang : data.f_lang
      }", p_lang = "${req.body.p_lang ? req.body.p_lang : data.p_lang}",
      fullName = "${req.body.fullName ? req.body.fullName : data.fullName}"
      WHERE sid = ${req.params.id};`,
      (error, results) => {
        if (error)
          return connection.rollback(() => {
            return res
              .status(400)
              .json({ success: false, error, message: "Rollback" });
          });
        console.log("Update profile...");
      }
    );

    connection.commit((error) => {
      if (error)
        return connection.rollback(() => {
          return res
            .status(400)
            .json({ success: false, error, message: "Rollback" });
        });
      console.log("Commit transaction");
      console.log(data);
      return res
        .status(200)
        .json({ success: true, message: "Edit successfully" });
    });
  });
};

module.exports.deleteStudent = (req, res, next) => {};

module.exports.loginStudent = async (req, res, next) => {
  connection.query(
    `SELECT * FROM account WHERE username="${req.body.username}"`,
    (error, document) => {
      if (error) return res.status(400).json({ error });

      if (document.length === 0)
        return res.status(404).json({ success: false, message: "Not found" });
      else {
        bcrypt.compare(req.body.password, document[0].password, (err, done) => {
          console.log(done);
          console.log(err);
          if (done == false)
            return res
              .status(400)
              .json({ success: false, message: "Wrong password" });

          let token = jwt.sign(
            { id: document[0].id, username: document[0].username },
            "s3cr3t",
            {
              expiresIn: "1w",
            }
          );
          return res.status(200).json({ success: true, token: token });
        });
      }
    }
  );
};

module.exports.changePassword = (req, res, next) => {
  connection.query(
    `SELECT * FROM account WHERE username = "${req.params.username}";`,
    (error, response) => {
      if (response.length == 0)
        return res
          .status(404)
          .json({ success: false, message: "No account found." });
      bcrypt.compare(req.body.old, response[0].password).then((success) => {
        bcrypt.hash(req.body.new, 10, (error, hash) => {
          connection.query(
            `UPDATE account SET password = '${hash}' WHERE username = '${req.params.username}';`,
            (error, response) => {
              if (error) return res.status(400).json({ success: false, error });
              return res.status(200).json({
                success: true,
                message: "Update password successfully",
              });
            }
          );
        });
      });
    }
  );
};

module.exports.forgotPassword = (req, res, next) => {
  connection.query(
    `SELECT * FROM Account WHERE username = "${req.params.username}";`,
    (error, response) => {
      if (response.length == 0)
        return res
          .status(404)
          .json({ success: false, message: "No account found." });
      bcrypt.hash(req.body.password, 10, (error, hash) => {
        connection.query(
          `UPDATE Account SET password = '${hash}' WHERE username = '${req.params.username}';`,
          (error, response) => {
            if (error) return res.status(400).json({ success: false, error });
            return res.status(200).json({
              success: true,
              message: "Retrieve password successfully",
            });
          }
        );
      });
    }
  );
};
