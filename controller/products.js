const connection = require("../connection");

module.exports.listProducts = (req, res) => {
  connection.query(
    "SELECT Product.*, Category.category_name FROM Product INNER JOIN Category ON Product.product_category = Category.category_id",
    (error, documents) => {
      if (error) return res.status(400).json({ success: false, error });
      else {
        return res.status(200).json({ success: true, data: documents });
      }
    }
  );
};

module.exports.getProductById = (req, res) => {
  connection.query(
    `SELECT Product.*, Category.category_name FROM Product 
        INNER JOIN Category ON Product.product_category = Category.category_id 
        WHERE product_id = ${req.params.id} `,
    (error, document) => {
      if (error) return res.status(400).json({ success: false, error });
      else {
        return res.status(200).json({ success: true, data: document });
      }
    }
  );
};
