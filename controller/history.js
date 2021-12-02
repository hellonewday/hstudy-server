const router = require("express").Router();
const connection = require("../connection");
const cloudinary = require("cloudinary");

cloudinary.config({
  cloud_name: "vn-esports",
  api_key: 996178356223912,
  api_secret: "rC8_6QyIf1DIbokVgSYe0VLsJwQ",
});

module.exports.findAllHistories = (req, res, next) => {
  connection.query(
    `SELECT * FROM History WHERE student = ${req.params.user}`,
    (error, documents) => {
      if (error) {
        return res.status(400).json({ success: false, error });
      } else
        return res.status(200).json({
          success: true,
          response: { counts: documents.length, data: documents },
        });
    }
  );
};

module.exports.findHistory = (req, res, next) => {
  connection.query(
    `SELECT * FROM History WHERE id = ${req.params.id}`,
    (error, documents) => {
      if (error) {
        return res.status(400).json({ success: false, error });
      } else
        return res.status(200).json({
          success: true,
          data: documents[0],
        });
    }
  );
};

module.exports.saveHistory = async (req, res, next) => {
  try {
    let videoUrl = await cloudinary.v2.uploader.upload(req.file.path, {
      resource_type: "video",
    });
    connection.query(
      `INSERT INTO History(logUrl,student,friend) VALUES ("${
        videoUrl.secure_url
      }",${req.body.user},"Anonymous #${Math.floor(
        Math.random() * (1000 - 1 + 1) + 1
      )}");
          `,
      (error, response) => {
        if (error) return res.status(400).json({ success: false, error });
        else return res.status(201).json({ success: true, response });
      }
    );
  } catch (UploadError) {
    return res.status(401).json({ success: false, error: UploadError });
  }
};
