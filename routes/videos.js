const router = require("express").Router();
const videos = require("../controller/videos");
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
  limits: 1024 * 1024 * 30,
});

router.get("/",videos.showVideosByCourse);
router.get("/:q", videos.findVideosByCourse);
router.post("/", upload.single("video"), videos.addVideoToCourse);
router.delete("/:videoId", videos.deleteVideoFromCourse);

module.exports = router;
