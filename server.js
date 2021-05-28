const express = require("express");
const app = express();
const cors = require("cors");
const os = require("os");

require("dotenv").config();

const PORT = process.env.PORT || 8088;

const courses = require("./routes/courses");
const providers = require("./routes/providers");
const authors = require("./routes/authors");
const videos = require("./routes/videos");
const students = require("./routes/students");
const manager = require("./routes/manager");

app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cors());

app.use("/uploads", express.static("uploads"));
app.use("/", express.static(__dirname));

app.use("/courses", courses);
app.use("/providers", providers);
app.use("/authors", authors);
app.use("/videos", videos);
app.use("/students", students);
app.use("/manager", manager);

app.listen(PORT, () => {
  console.log(`Listening on port ${PORT} on ${os.platform()}`);
});
