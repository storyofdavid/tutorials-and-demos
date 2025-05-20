# Google Gemini Vibe Coding
A sample of the code output from our vibe coding session using Google Gemini where we created a to do list web application.

Youtube Video: https://youtu.be/XW3B9Ovx47M


# To Run The App
To run the app use the following commands:

1. Build the docker container
```
docker build -t todo-app .
```
2. Run the docker container
```
docker run -d -p 8080:80 --name my-todo-container todo-app
```
Note: I had to use a differnt port and name as they were currently in use, here is the exact command that I ran in the video:
```
docker run -d -p 8082:80 --name my-todo-container-3 todo-app
```