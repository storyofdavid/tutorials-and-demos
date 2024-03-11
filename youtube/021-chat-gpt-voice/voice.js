const fs = require("fs");
const path = require("path");
const { default: OpenAI } = require("openai");


const apiKeyFilePath = path.resolve("./apiKey");
// Read the API key from the file
const apiKey = fs.readFileSync(apiKeyFilePath, 'utf8').trim();
const openai = new OpenAI({ apiKey });

const speechFile = path.resolve("./speech.mp3");

async function main() {
  const completion = await openai.chat.completions.create({
    messages: [{"role": "system", "content": "Be sassy, and a tad mean in your replies"},
        {"role": "user", "content": "You're featuring in my tiktok video"},
        ],
    model: "gpt-3.5-turbo",
  });

  response = completion.choices[0].message.content
  console.log(response);

  const mp3 = await openai.audio.speech.create({
  model: "tts-1",
  voice: "alloy",
  input: response,
  });
  console.log(speechFile);
  const buffer = Buffer.from(await mp3.arrayBuffer());
  await fs.promises.writeFile(speechFile, buffer);
}

main();
