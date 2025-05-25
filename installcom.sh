#!/bin/bash
userid=$(id -u) 
if [userid -ne=0]
then 
echo "error: please run with root user id"
fi
