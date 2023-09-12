const connection = require("../connection");

module.exports.listActiveCartItemsByUser = (req, res) => {
  connection.query(
    `select Product.product_id, Product.product_name, quantity, Product.price * quantity as total, 
  Product.price as perItem from UserProduct INNER JOIN Product ON UserProduct.product_id = Product.product_id 
  WHERE user_id = ${req.params.id} AND cart_status = 1
    `,
    (error, documents) => {
      if (error) return res.status(400).json({ success: false, error });
      else {
        return res.status(200).json({ success: true, data: documents });
      }
    }
  );
};

module.exports.addToCart = (req, res) => {
  connection.query(
    `INSERT INTO UserProduct VALUES (${req.body.user},${req.params.id},${req.body.quantity},${req.body.status},NOW())`,
    (error, response) => {
      if (error) return res.status(400).json({ success: false, error });
      else {
        return res.status(200).json({ success: true, response });
      }
    }
  );
};

module.exports.modifyQuantity = (req, res) => {
  connection.query(
    `UPDATE UserProduct SET quantity = ${req.body.quantity} WHERE user_id = ${req.body.user} and product_id = ${req.body.product} 
        AND cart_status = 1`,
    (error, response) => {
      if (error) return res.status(400).json({ success: false, error });
      else {
        return res.status(200).json({ success: true, response });
      }
    }
  );
};

module.exports.deleteProduct = (req, res) => {
  connection.query(
    `DELETE FROM UserProduct WHERE user_id = ${req.body.user} and product_id = ${req.params.id} AND cart_status = 1`,
    (error, response) => {
      if (error) return res.status(400).json({ success: false, error });
      else {
        return res.status(200).json({ success: true, response });
      }
    }
  );
};
