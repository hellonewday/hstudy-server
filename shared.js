const ffmpeg = require("fluent-ffmpeg");
const util = require("util");
const exec = util.promisify(require("child_process").exec);

var ffprobe = require("ffprobe-static").path;
const ffmpegPath = require("@ffmpeg-installer/ffmpeg").path;
const fs = require("fs");

ffmpeg.setFfmpegPath(ffmpegPath);
ffmpeg.setFfprobePath(ffprobe);

module.exports.convertToFlac = (inputFilePath) => {
  // Output audio file path
  const outputFilePath = `temp-${Math.floor(Math.random() * 1000)}.flac`; // Replace with your desired output file path

  // New encoding format (LINEAR16 or FLAC)
  const newEncoding = "flac";

  // Create a new FFmpeg command
  const command = ffmpeg();

  // Set the input file path
  command.input(inputFilePath);

  // Set the encoding format
  command.audioCodec(newEncoding);

  command.audioFilters("aformat=s16:44100");

  // Set the output file format
  command.toFormat(newEncoding);

  // Save the output to the specified file
  command.save(outputFilePath);

  // Run the FFmpeg command
  command
    .on("end", () => {
      let savedFile = fs.readFileSync(outputFilePath);
      console.log(savedFile.toString("base64"));
      return savedFile.toString("base64");
    })
    .run();
};
