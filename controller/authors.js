const connection = require("../connection");

module.exports.showAuthors = (req, res, next) => {
  connection.query(`SELECT * FROM Author`, (error, response) => {
    if (error) return res.status(400).json({ success: false, error });
    else return res.status(201).json({ success: true, response });
  });
};

module.exports.findAuthors = (req,res,next) => {
    connection.query(``)
}