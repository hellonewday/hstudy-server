const router = require("express").Router();
const providers = require("../controller/providers");

router.get("/", providers.showProviders);
router.get("/:q", providers.searchProviders);
router.post("/", upload.single("image"), providers.createProvider);
router.delete("/:providerId", providers.deleteProvider);

module.exports = router;