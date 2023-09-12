const connection = require("../connection");


module.exports.listPromotions = (req, res) => {
    connection.query(
      `SELECT Promotion.* FROM ProductPromotion INNER JOIN Promotion ON ProductPromotion.promo_id = Promotion.promo_id WHERE product_id = 
      ${req.params.id}`,
      (error, documents) => {
        if (error) return res.status(400).json({ success: false, error });
        else {
          return res.status(200).json({ success: true, data: documents });
        }
      }
    );
  };
  