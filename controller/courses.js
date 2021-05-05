const connection = require("../connection");
const cloudinary = require("cloudinary");

cloudinary.config({
  cloud_name: "vn-esports",
  api_key: 996178356223912,
  api_secret: "rC8_6QyIf1DIbokVgSYe0VLsJwQ",
});

module.exports.showCourses = (req, res, next) => {
  connection.query(
    `SELECT 
    course.id,
    course.courseName,
    course.level,
    course.description,
    course.courseImage,
    author.fullname AS author
FROM
    Course
        INNER JOIN
    Author ON course.author = author.id;`,
    (error, document) => {
      if (error) return res.status(400).json({ success: false, error });
      else return res.status(200).json({ result: document });
    }
  );
};

module.exports.findCourses = (req, res, next) => {
  connection.query(
    `SELECT 
    course.id,
    course.courseName,
    course.level,
    course.description,
    course.courseImage,
    author.fullname AS author
FROM
    Course
        INNER JOIN
    Author ON course.author = author.id
WHERE
    course.courseName LIKE '%${req.params.q}%';`,
    (error, document) => {
      if (error) return res.status(400).json({ success: false, error });
      else return res.status(200).json({ result: document });
    }
  );
};

module.exports.addCourse = async (req, res, next) => {
  try {
    let image_upload = await cloudinary.v2.uploader.upload(req.file.path, {
      resource_type: "image",
    });
    connection.query(
      `INSERT INTO Course(courseName,level,author,description,courseImage) VALUES ("${req.body.courseName}","${req.body.level}",${req.body.author},"${req.body.description}","${image_upload.secure_url}");`,
      (error, response) => {
        if (error) return res.status(400).json({ success: false, error });
        else return res.status(201).json({ success: true, response });
      }
    );
  } catch (uploadError) {
    return res.status(404).json({ success: false, error: uploadError });
  }
};

module.exports.deleteCourse = async (req, res, next) => {
  connection.query(
    `DELETE FROM Course WHERE id = ${req.params.courseId}`,
    (error, response) => {
      if (error) return res.status(400).json({ success: false, error });
      else return res.status(200).json({ success: true, response });
    }
  );
};