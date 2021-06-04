const connection = require("../connection");

function checkStudentAttendance(s1, s2) {
  s1.map((e) => {
    if (s2.some((ele) => ele.vid === e.id)) {
      e["isDone"] = true;
    } else {
      e["isDone"] = false;
    }
  });

  return s1;
}

module.exports.enrollmentAttendance = (req, res, next) => {
  connection.query(
    `SELECT * FROM VideoCourse WHERE course = ${req.params.courseId};`,
    (error, videos) => {
      if (error) console.log(error);

      connection.query(
        `SELECT
            StudentVideo.vid,
            StudentVideo.status,
            VideoCourse.videoName,
            VideoCourse.videoUrl
            FROM
            StudentVideo
                INNER JOIN
            VideoCourse ON StudentVideo.vid = VideoCourse.id
            WHERE
            VideoCourse.course =${req.params.courseId}
                AND StudentVideo.sid = ${req.query.user};`,
        (error, student_videos) => {
          if (error) console.log(error);

          return res.status(200).json({
            undone: videos.length - student_videos.length === 0 ? true : false,
            data: checkStudentAttendance(videos, student_videos),
          });
        }
      );
    }
  );
};
