const router = require("express").Router();
const products = require("../controller/products");

router.get("/", products.listProducts);
router.get("/:id", products.getProductById);

module.exports = router;
