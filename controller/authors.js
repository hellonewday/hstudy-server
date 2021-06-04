const connection = require("../connection");

module.exports.showAuthors = (req, res, next) => {
  connection.query(
    `
  SELECT 
    Author.id,
    Author.fullname,
    Author.gender,
    CourseProvider.providerName,
    CourseProvider.imageUrl,
    Author.description
FROM
    Author
        INNER JOIN
    CourseProvider ON Author.provider = CourseProvider.id;
  `,
    (error, document) => {
      if (error) return res.status(400).json({ success: false, error });
      else
        return res.status(200).json({
          success: true,
          response: { counts: document.length, data: document },
        });
    }
  );
};

module.exports.findAuthors = (req, res, next) => {
  connection.query(
    `
  SELECT 
    Author.id,
    Author.fullname,
    Author.gender,
    CourseProvider.providerName,
    CourseProvider.imageUrl,
    Author.description
FROM
    Author
        INNER JOIN
    CourseProvider ON Author.provider = CourseProvider.id
    WHERE Author.fullname LIKE '%${req.params.q}%';`,
    (error, document) => {
      if (error) return res.status(400).json({ success: false, error });
      else
        return res.status(200).json({
          success: true,
          response: { counts: document.length, data: document },
        });
    }
  );
};

module.exports.addAuthor = (req, res, next) => {
  connection.query(
    `
  INSERT 
    INTO Author(provider,description,fullname,gender) 
  VALUES 
    (${req.body.provider},"${req.body.description}","${req.body.fullname}","${req.body.gender}");
  `,
    (error, document) => {
      if (error) return res.status(400).json({ success: false, error });
      else
        return res.status(201).json({
          success: true,
          response: document,
        });
    }
  );
};

module.exports.deleteAuthor = (req, res, next) => {
  connection.query(
    `
    DELETE FROM Author WHERE id = ${req.params.authorId};
  `,
    (error, document) => {
      if (error) return res.status(400).json({ success: false, error });
      else
        return res.status(200).json({
          success: true,
          response: document,
        });
    }
  );
};
