#!/bin/bash

directory="btulab.github.io" #directory where the webpage resides
page="lully.html" #page to edit

open -a Terminal.app octoprint.sh
open -a Terminal.app ngrok.sh

sleep 1
sedStart='s_http:\/\/.*?io\/_'
url="$(curl http://localhost:4040/inspect/http | egrep -o 'http?://[^ ]+' | cut -d "\\" -f 1)"
url="$url/"
sedEnd='_g'

cd $directory
sed -i.bak -E $sedStart$url$sedEnd $page

git add --all
git commit -m "Updated Redirect URL"
git push origin master
