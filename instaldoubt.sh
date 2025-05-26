#!/bin/bash
userid=$(id -u )
if [ $userid -eq 0 ]
then
dnf list installed mysql 
if [ $? -eq 0 ]
then
dnf install mysql -y
echo "run with dnf successfully"
else
echo "install dnf with root user and fail"
exit1
fi