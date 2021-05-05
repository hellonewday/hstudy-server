const router = require("express").Router();
const authors = require("../controller/authors");

router.get("/", courses.showCourses);
router.get("/:q", courses.findCourses);
router.post("/", upload.single("image"), courses.addCourse);
router.delete("/:courseId", courses.deleteCourse);

module.exports = router;
