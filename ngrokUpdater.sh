#!/bin/bash

page="btulab.github.io" #Path to html page to update

../venv/bin/octoprint &
./ngrok http 5000 &
sleep 1
sedStart='s_http:\/\/.*?io\/_'
url="$(curl http://localhost:4040/inspect/http | egrep -o 'http?://[^ ]+' | cut -d "\\" -f 1)"
url="$url/"
sedEnd='_g'

sed -i.bak -E $sedStart$url$sedEnd $page

git add --all
git commit -m "Updated Redirect URL"
git push origin master
