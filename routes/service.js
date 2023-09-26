const router = require("express").Router();
const Redis = require("ioredis");
const axios = require("axios");
const os = require("os");
const fs = require("fs");
var multer = require("multer");
var path = require("path");
const ffmpeg = require("fluent-ffmpeg");

var ffprobe = require("ffprobe-static").path;
const ffmpegPath = require("@ffmpeg-installer/ffmpeg").path;

var storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "uploads/");
  },
  filename: function (req, file, cb) {
    cb(null, Date.now() + path.extname(file.originalname)); //Appending extension
  },
});

var upload = multer({ storage: storage });

ffmpeg.setFfmpegPath(ffmpegPath);
ffmpeg.setFfprobePath(ffprobe);

const redisClient = new Redis({
  host: "159.138.133.224",
  port: 6379,
  password: "Huawei@123",
});

async function textToSpeech(text) {
  const textToSpeech = require("@google-cloud/text-to-speech");

  const client = new textToSpeech.TextToSpeechClient({
    keyFilename: "keys/key.json",
  });

  const request = {
    input: { text: text },
    voice: { languageCode: "en-US", ssmlGender: "NEUTRAL" },
    audioConfig: { audioEncoding: "MP3" },
  };
  const [response] = await client.synthesizeSpeech(request);
  return response;
}

async function speechToText(base64) {
  const speechToText = require("@google-cloud/speech");

  const client = new speechToText.SpeechClient({
    keyFilename: "keys/key.json",
  });

  let config = {
    model: "default",
    encoding: "FLAC",
    sampleRateHertz: 44100,
    audioChannelCount: 2,
    enableWordTimeOffsets: true,
    enableWordConfidence: true,
    languageCode: "en-US",
  };

  let audio = {
    content: base64,
  };

  let request = {
    audio: audio,
    config: config,
  };
  console.log("Start to call Speech API ");
  // console.log(request);
  const [response] = await client.recognize(request);
  const transcription = response.results
    .map((result) => result.alternatives[0].transcript)
    .join("\n");

  return transcription;
}

router.post("/auth", async (req, res) => {
  const cachedAuthToken = await redisClient.get(
    "authToken-" + req.body.username
  );
  if (cachedAuthToken) {
    console.log("fetching from cache");
    return res.status(200).json({ authToken: cachedAuthToken });
  } else {
    console.log("create new token in redis");
    let request = {
      auth: {
        identity: {
          password: {
            user: {
              name: req.body.username,
              password: req.body.password,
              domain: {
                name: req.body.tenant,
              },
            },
          },
          methods: ["password"],
        },
        scope: {
          project: {
            name: req.body.region,
          },
        },
      },
    };

    const response = await axios.post(
      "https://iam.ap-southeast-3.myhuaweicloud.com/v3/auth/tokens",
      request
    );
    const authToken = response.headers["x-subject-token"];
    await redisClient.set(
      "authToken-" + req.body.username,
      authToken,
      "EX",
      86400
    );

    return res.json({ authToken });
  }
});

// Google Cloud Text to Speech
router.post("/tts", async (req, res) => {
  console.log("text to speech ");
  textToSpeech(req.body.text)
    .then((response) => {
      return res.json({
        success: true,
        response: response.audioContent.toString("base64"),
      });
    })
    .catch((error) => {
      console.log(error);
    });
});

router.post("/stt", upload.single("audioFile"), async (req, res) => {
  console.log("speech to text");
  if (!req.file) {
    return res.status(400).send("No file uploaded.");
  }

  const audioFilePath = req.file.path;
  console.log(audioFilePath);

  const outputFilePath = `temp-${Math.floor(Math.random() * 1000)}.flac`; // Replace with your desired output file path

  // New encoding format (LINEAR16 or FLAC)
  const newEncoding = "flac";

  // Create a new FFmpeg command
  const command = ffmpeg();

  // Set the input file path
  command.input(audioFilePath);

  // Set the encoding format
  command.audioCodec(newEncoding);

  command.audioFilters("aformat=s16:44100");

  // Set the output file format
  command.toFormat(newEncoding);

  // Save the output to the specified file
  command.save(outputFilePath);

  // Run the FFmpeg command
  command.run();
  console.log("set time out for writing file");
  const interval = setInterval(() => {
    fs.access(outputFilePath, fs.constants.F_OK, (err) => {
      if (!err) {
        // The file exists, so clear the interval and continue with your process
        clearInterval(interval);

        // console.log("done");
        console.log("it should be done now!");
        console.log(outputFilePath);
        const savedFile = fs.readFileSync(outputFilePath);
        const audioBytes = savedFile.toString("base64");
        speechToText(audioBytes)
          .then((response) => {
            console.log(response);
            return res.json({ success: true, transcription: response });
          })
          .catch((error) => {
            console.log(error);
            return res.json({ success: false, transcription: null, error });
          });
      }
    });
  }, 500);

  // setTimeout(() => {
  //   console.log("it should be done now!");
  //   console.log(outputFilePath);
  //   const savedFile = fs.readFileSync(outputFilePath);
  //   const audioBytes = savedFile.toString("base64");
  //   speechToText(audioBytes)
  //     .then((response) => {
  //       console.log(response);
  //       return res.json({ success: true, transcription: response });
  //     })
  //     .catch((error) => {
  //       console.log(error);
  //       return res.json({ success: false, transcription: null, error });
  //     });
  // }, 2500);

  // speechToText(convertToFlac(audioFilePath))
  //   .then((response) => {
  //     console.log(response);
  //     // res.json({ success: true, transcription: response });
  //   })
  //   .catch((error) => {
  //     console.log(error);
  //   });
  // console.log(audioFilePath);
});

router.post("/chatbot", async (req, res) => {
  const authToken = req.headers["authorization"];
  if (req.body.question === null && req.body.question === "") {
    return res.status(400).json({
      success: false,
    });
  } else {
    let body = {
      session_id: "demo",
      question: req.body.question,
    };

    let response = await axios.post(
      "https://cbs-ext.ap-southeast-1.myhuaweicloud.com/v1/a20f80e8e54545b78b0d6616a9c0fe4e/qabots/43b23b69-9bb1-4851-a22d-e7c4f6682401/requests",
      body,
      {
        headers: {
          "X-Auth-Token": authToken,
        },
      }
    );

    let result = await response.data;
    console.log("Back-end response: ", result["answers"][0].answer);
    return res.json({
      success: true,
      answer: result["answers"][0].answer,
    });
  }
});

// Google Cloud Speech to Text

module.exports = router;
