const router = require("express").Router();
const authors = require("../controller/authors");

router.get("/", authors.showAuthors);
router.get("/:q", authors.findAuthors);
router.post("/", authors.addAuthor);
router.delete("/:authorId", authors.deleteAuthor);

module.exports = router;
