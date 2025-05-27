#!/bin/bash
userid=$(id -u)
if [ $userid -eq 0 ]
then
echo "dnf installed  with root user"

else
echo "please install dnf with root user"
fi
dnf install mysql -y

if [ $? -eq 0 ]
then
echo "run with dnf successfully"
else
echo "install dnf with root user and fail"
exit 1
fi