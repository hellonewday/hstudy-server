const router = require("express").Router();
const connection = require("../connection");
const cloudinary = require("cloudinary");

cloudinary.config({
  cloud_name: "vn-esports",
  api_key: 996178356223912,
  api_secret: "rC8_6QyIf1DIbokVgSYe0VLsJwQ",
});

module.exports.callStatistics = (req, res, next) => {
  connection.query(
    `SELECT type, SUM(duration) AS totalMiliseconds, COUNT(type) AS numberOfCalls FROM history WHERE student = ${req.params.user} group by type`,
    (error, documents) => {
      if (error) {
        return res.status(400).json({ success: false, error });
      } else
        return res.status(200).json({
          success: true,
          statistics: documents,
        });
    }
  );
};

module.exports.findAllHistories = (req,res,next) => {
  connection.query(
    `SELECT * FROM history WHERE student = ${req.params.user}`,
    (error, documents) => {
      if (error) {
        return res.status(400).json({ success: false, error });
      } else
        return res.status(200).json({
          success: true,
          response: { counts: documents.length, data: documents.reverse() },
        });
    }
  );
}

module.exports.listAllHistories = (req,res,next) => {
  connection.query(
    `SELECT * FROM history`,
    (error, documents) => {
      if (error) {
        return res.status(400).json({ success: false, error });
      } else
        return res.status(200).json({
          success: true,
          response: { counts: documents.length, data: documents.reverse() },
        });
    }
  );
}

module.exports.findHistory = (req, res, next) => {
  connection.query(
    `SELECT * FROM history WHERE id = ${req.params.id}`,
    (error, documents) => {
      if (error) {
        return res.status(400).json({ success: false, error });
      }
      if (documents.length == 0)
        return res
          .status(404)
          .json({ success: false, message: "No history found!" });
      else
        return res.status(200).json({
          success: true,
          data: documents[0],
        });
    }
  );
};

module.exports.saveHistory = async (req, res, next) => {
  connection.query(
    `INSERT INTO history(student,friend,type, duration) VALUES (${req.body.user},"Anonymous #${Math.floor(
      Math.random() * (1000 - 1 + 1) + 1
    )}", "${req.body.type}",${req.body.duration});
        `,
    (error, response) => {
      if (error)
        return res
          .status(400)
          .json({ success: false, message: "System error" });
      else
        return res
          .status(201)
          .json({ success: true, message: "Save history successfully" });
    }
  );

};


