#!/bin/bash

echo "all variables passed to the script: $@"
echo "number of variables: $#"
echo "script name: $0"
echo "present working directiory: $PWD"
echo "home directiory: $HOME"
echo "user running the script: $USER"
echo "process instant id of the current script: $$"
sleep 10 &
echo "pid of last command in background: $!"