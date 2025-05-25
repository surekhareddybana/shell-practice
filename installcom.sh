#!/bin/bash
USERID=$(id -U) 

if [ USERID -ne=0 ]
then 
echo "error: please run with root user id"
fi
