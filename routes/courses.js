const router = require("express").Router();
const courses = require("../controller/courses");
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

router.get("/", courses.showCourses);
router.get("/:q", courses.findCourses);
router.post("/", upload.single("image"), courses.addCourse);
router.delete("/:courseId", courses.deleteCourse);

module.exports = router;
