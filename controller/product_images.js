const connection = require("../connection");

module.exports.loadImages = (req, res) => {
  connection.query(
    `SELECT * FROM ProductImage WHERE product_id = ${req.params.id}`,
    (error, document) => {
      if (error) return res.status(400).json({ error });
      else {
        return res.status(200).json({ success: true, data: document });
      }
    }
  );
};
