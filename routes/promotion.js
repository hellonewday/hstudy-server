const router = require("express").Router();
const promotion = require("../controller/promotions");

router.get("/:id", promotion.listPromotions);

module.exports = router;
