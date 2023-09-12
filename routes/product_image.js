const router = require("express").Router();
const pImages = require("../controller/product_images");

router.get("/:id", pImages.loadImages);

module.exports = router;
