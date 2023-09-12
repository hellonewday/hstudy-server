const router = require("express").Router();
const manager = require("../controller/manager");

router.post("/login", manager.loginManager);

module.exports = router;