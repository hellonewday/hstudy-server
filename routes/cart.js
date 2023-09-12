const router = require("express").Router();
const carts = require("../controller/carts");

router.get("/:id",carts.listActiveCartItemsByUser);
router.post("/", carts.addToCart)
router.put("/:id",carts.modifyQuantity);
router.delete("/:id",carts.deleteProduct);

module.exports = router;
