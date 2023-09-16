const express = require("express");
const app = express();
const cors = require("cors");
const os = require("os");

const manager = require("./routes/manager");
const product = require("./routes/product");
const pImage = require("./routes/product_image");
const promotion = require("./routes/promotion");
const cart = require("./routes/cart");
const service = require("./routes/service");
require("dotenv").config();

const PORT = process.env.PORT || 8088;

app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cors());

app.use("/uploads", express.static("uploads"));

app.use("/manager", manager);
app.use("/products", product);
app.use("/pimages", pImage);
app.use("/promotions", promotion);
app.use("/cart", cart);
app.use("/service", service);

app.listen(PORT, () => {
  console.log(`Listening on port ${PORT} on ${os.platform()}`);
});
