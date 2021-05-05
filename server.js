const express = require("express");
const app = express();
const cors = require("cors");
const PORT = process.env.PORT || 8088;
const os = require("os");

const courses = require("./routes/courses");

app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cors());

app.use("/uploads", express.static("uploads"));
app.use("/", express.static(__dirname));

app.use("/courses", courses);

app.listen(PORT, () => {
  console.log(`Listening on port ${PORT} on ${os.platform()}`);
});
