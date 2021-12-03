const router = require("express").Router();
const students = require("../controller/students");
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

router.get("/", students.listStudents);
router.get("/:sid", students.getStudent);

router.post("/login", students.loginStudent);
router.post("/", students.addStudent);

router.patch("/:id", students.updateStudent);
router.patch("/:username/change",students.changePassword);
router.patch("/:username/forgot",students.forgotPassword);

router.delete("/:providerId", students.deleteStudent);

module.exports = router;
