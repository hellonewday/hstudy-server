-- List all courses
SELECT 
    course.id,
    course.courseName,
    course.level,
    course.description,
    course.courseImage,
    author.fullname AS author
FROM
    Course
        INNER JOIN
    Author ON course.author = author.id;
    
-- Search some courses
SELECT 
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
    course.courseName LIKE '%Ja%';
    
    