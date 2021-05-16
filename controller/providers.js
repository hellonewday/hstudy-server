const connection = require("../connection");
const cloudinary = require("cloudinary");

cloudinary.config({
  cloud_name: "vn-esports",
  api_key: 996178356223912,
  api_secret: "rC8_6QyIf1DIbokVgSYe0VLsJwQ",
});

module.exports.showProviders = (req, res, next) => {
  connection.query("SELECT * FROM CourseProvider", (error, documents) => {
    if (error) {
      return res.status(400).json({ success: false, error });
    } else
      return res.status(200).json({
        success: true,
        response: { counts: documents.length, data: documents },
      });
  });
};

module.exports.searchProviders = (req, res, next) => {
  connection.query(
    `SELECT * FROM CourseProvider WHERE courseprovider.providerName LIKE '%${req.params.q}%';`,
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

module.exports.createProvider = async (req, res, next) => {
  try {
    let imageUrl = await cloudinary.v2.uploader.upload(req.file.path, {
      resource_type: "image",
    });
    connection.query(
      `INSERT INTO CourseProvider(providerName,location,imageUrl,description) VALUES ("${req.body.name}","${req.body.location}","${imageUrl.secure_url}","${req.body.description}");`,
      (error, response) => {
        if (error) return res.status(400).json({ success: false, error });
        else return res.status(201).json({ success: true, response });
      }
    );
  } catch (UploadError) {
    return res.status(401).json({ success: false, error: UploadError });
  }
};

module.exports.deleteProvider = (req, res, next) => {
  connection.query(
    `DELETE FROM CourseProvider WHERE id = ${req.params.providerId};`,
    (error, response) => {
      if (error) return res.status(400).json({ success: false, error });
      else {
        return res.status(200).json({ success: true, response });
      }
    }
  );
};
