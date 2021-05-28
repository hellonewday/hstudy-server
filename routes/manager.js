const router = require("express").Router();
const manager = require("../controller/manager");
router.get("/attendance/:courseId",manager.enrollmentAttendance);

module.exports = router;