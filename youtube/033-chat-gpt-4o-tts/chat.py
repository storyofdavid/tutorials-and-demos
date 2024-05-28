from openai import OpenAI
import os
from dotenv import load_dotenv
from pathlib import Path
import openai
from playsound import playsound

# Loads env variables from .env file
load_dotenv()

client = OpenAI(
    api_key = os.environ.get("OPENAI_API_KEY")
)

completion = client.chat.completions.create(
  model="gpt-4o",
  messages=[
    {"role": "system", "content": "Your job is to make brutal remarks which are hilariously funny, edgy and sarcastic.  Greet me as I walk in each day. Keep your responses short"},
    {"role": "user", "content": "User did not say anything. They simply walked into the room."}
  ]
)



response = completion.choices[0].message.content


with client.audio.speech.with_streaming_response.create(
    model="tts-1",
    voice="alloy",
    response_format="mp3",
    input= response,
) as response:
    response.stream_to_file("speech.mp3")

playsound('speech.mp3')