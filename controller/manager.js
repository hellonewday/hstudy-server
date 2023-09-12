const connection = require("../connection");

module.exports.loginManager = (req, res, next) => {
  connection.query(
    `SELECT * FROM Manager WHERE username="${req.body.username}" AND password="${req.body.password}"`,
    (error, document) => {
      if (error) return res.status(400).json({ error });
      if (document.length === 0)
        return res.status(404).json({ success: false, message: "Not found" });
      else {
        return res.status(200).json({ success: true });
      }
    }
  );
};
