const router = require("express").Router();
const providers = require("../controller/providers");
const multer = require("multer");

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "./uploads");
  },
  filename: function (req, file, cb) {
    cb(null, Date.now() + file.originalname);
  },
});
const filterUpload = function (req, file, cb) {
  if (file.mimetype === "image/jpeg" || file.mimetype === "image/png") {
    cb(null, true);
  } else {
    cb(null, false);
  }
};
const upload = multer({
  storage: storage,
  fileFilter: filterUpload,
  limits: 1024 * 1024 * 25,
});

router.get("/", providers.showProviders);
router.get("/:q", providers.searchProviders);
router.post("/", upload.single("image"), providers.createProvider);
router.delete("/:providerId", providers.deleteProvider);

module.exports = router;
