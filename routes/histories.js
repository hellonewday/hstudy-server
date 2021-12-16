const router = require("express").Router();
const histories = require("../controller/history");
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
  if (file.mimetype === "video/mp4") {
    cb(null, true);
  } else {
    cb(null, false);
  }
};
const upload = multer({
  storage: storage,
  fileFilter: filterUpload,
  limits: 1024 * 1024 * 500,
});

router.get("/all/:user",histories.findAllHistories);
router.get("/statistics/:user",histories.callStatistics);
router.get("/:id",histories.findHistory);
router.post("/", upload.single("video"), histories.saveHistory);

module.exports = router;