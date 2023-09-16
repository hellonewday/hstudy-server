const router = require("express").Router();
const Redis = require("ioredis");
const axios = require("axios");
const os = require("os");
const redisClient = new Redis({
  host: os.platform() == "linux" ? "192.168.0.171" : "159.138.133.224",
  port: 6379,
  password: "Huawei@123",
});

router.post("/auth", async (req, res) => {
  const cachedAuthToken = await redisClient.get(
    "authToken-" + req.body.username
  );
  if (cachedAuthToken) {
    console.log("fetching from cache");
    return res.status(301).json({ authToken: cachedAuthToken });
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
            name: "ap-southeast-3",
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

router.post("/stt", async (req, res) => {
  try {
    const authToken = req.headers["authorization"]; // Get the auth token from the request body

    // Encode the Buffer to Base64
    let body = {
      config: {
        audio_format: "pcm8k16bit",
        property: "english_8k_common",
        add_punc: "yes",
      },
      data: req.body.base64,
    };
    // Make a POST request to the second API using the auth token
    const response = await axios.post(
      `https://sis-ext.ap-southeast-3.myhuaweicloud.com/v1/${req.body.projectId}/asr/short-audio`,
      body,
      {
        headers: {
          "X-Auth-Token": authToken, // Include the auth token in the request headers
        },
      }
    );

    // // Return the response from the second API as a JSON response
    res.json(response.data);
  } catch (error) {
    console.log(error);
    res.status(500).json({ error: "Failed to make the main request" });
  }
});

module.exports = router;
