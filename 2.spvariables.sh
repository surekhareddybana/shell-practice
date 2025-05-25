#!/bin/bash

echo "all the variables passed to script:$@"
echo "number of variables passed to the script:$#"
echo "scriptname:$0"
echo "present working directory:$PWD"
echo "home directiory of the user:$HOME"
echo "which user running to the script:$USER"
echo "preent instant id of the current script:$$"
sleep 10 &
echo "pid of the background command:$!"

