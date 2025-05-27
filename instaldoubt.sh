#!/bin/bash
userid=$(id -u)
if [ $userid -ne 0 ]
then
echo "error::dnf installed  with root user"
exit 1
else
echo "plz install dnf with root user"
fi
dnf install mysql -y

if [ $? -eq 0 ]
then
echo "run with dnf successfully"
else
echo "install dnf with root user and fail"
exit 1
fi