# Install Claude Code On A Raspberry Pi
Here are all of the command we ran in this video.
You can simply copy + paste the commands below to setup claude code on your raspberry pi.
</br></br></br>
<b>Step 1 - Install claude code:</b></br>
https://code.claude.com/docs/en/quickstart </br></br>
```curl -fsSL https://claude.ai/install.sh | bash```

After installation copy the command that appears in the output and run it.. it should look something like ```echo 'export PATH=$HOME...```

</br></br>


<b>Step 2 - Install NodeJs</b></br>
This is a pre-requisit required before you can install playwright. </br></br>
```curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -sudo apt-get install -y nodejs```


</br></br>
<b>Step 3 - Install Chromium web browser</b></br>
There are compatibility issues with playwright and the default web browser on the raspberry pi - which is why we have to install this web browser.

```sudo apt-get install -y chromium```

Run this command to verify the install location (will be used in step 4)

```which chromium```
</br></br></br>
<b>Step 4 - Add the MCP Server</b></br>
Make sure that ececutable-path matches the folder location from the output of which chromium.
Use the headless flag to make it operate in the background.

```claude mcp add playwright -- npx @playwright/mcp@latest --executable-path /usr/bin/chromium --headless```




## How To Automate Social Media Posts | Claude Code + Raspberry Pi
https://youtu.be/GXodRL8lodM

[![Watch the video](https://img.youtube.com/vi/GXodRL8lodM/hqdefault.jpg)](https://youtu.be/GXodRL8lodM)
