const router = require("express").Router();
const connection = require("../connection");
const cloudinary = require("cloudinary");

cloudinary.config({
  cloud_name: "vn-esports",
  api_key: 996178356223912,
  api_secret: "rC8_6QyIf1DIbokVgSYe0VLsJwQ",
});

module.exports.showVideosByCourse = (req, res, next) => {
  connection.query(
    `SELECT 
    VideoCourse.id,
    VideoCourse.videoName,
    VideoCourse.videoUrl,
    Course.courseName
FROM
    VideoCourse
        INNER JOIN
    Course ON VideoCourse.course = Course.id
WHERE
    course = ${req.query.course};`,
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

module.exports.findVideosByCourse = (req, res, next) => {
  connection.query(
    `SELECT 
  VideoCourse.id,
  VideoCourse.videoName,
  VideoCourse.videoUrl,
  Course.courseName
FROM
  VideoCourse
      INNER JOIN
  Course ON VideoCourse.course = Course.id
WHERE
  course = 1 AND videoName LIKE '%${req.params.q}%';`,
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

module.exports.addVideoToCourse = async (req, res, next) => {
  try {
    let videoUrl = await cloudinary.v2.uploader.upload(req.file.path, {
      resource_type: "video",
    });
    connection.query(
      `INSERT INTO VideoCourse(videoName,videoUrl,course) VALUES ("${req.body.videoName}","${videoUrl.secure_url}",${req.body.course});
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

module.exports.deleteVideoFromCourse = (req, res, next) => {
  connection.query(
    `DELETE FROM VideoCourse WHERE id = ${req.params.videoId};`,
    (error, response) => {
      if (error) return res.status(400).json({ success: false, error });
      else return res.status(200).json({ success: true, response });
    }
  );
};
