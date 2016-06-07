# ngrok-updater
URL updater for easy 3D printer access

This is a tool for OSX (With a few tweaks, it could run on any unix system) that launches octoprint (3D printer remote control) and ngrok (serves localhost on the web,) then updates the redirect url of btulab.github.io/lully

##Requirements

To use this script, you must have installed homebrew, which is required to use octoprint anyway.

You must also use gsed for the sed commands to work correctly. The following command will replace the OSX sed command with gsed.

In order to not have github prompt you for a password when launching the script, you should use an SSH key.
```
brew install gsed --with-default-names
```

##Usage

* Copy the sampleIndex.html to your github pages repo.
* Update the directory and page variables in ngrokUpdater.sh. They should point to the github repo where your github pages resides, and the page you want to update respectively.
* Update the path to ngrok and octoprint in ngrok.sh and octoprint.sh respectively. **Relative paths do NOT work here,** due to how the terminal spawns new windows.
* Run the following in your terminal
```
./ngrokUpdater
```
* Optional: Minimize the octoprint and ngrok windows

##Stopping ngrok and octoprint

To stop octoprint, simpy press Ctrl+C in its terminal window
To stop ngrok, type the following command
```
lsof -i TCP:4040
```
and get its PID. Then kill it with the following command (without the square brackets)
```
kill [PID GOES HERE]
```

And yes, I realize how convoluted this is.
