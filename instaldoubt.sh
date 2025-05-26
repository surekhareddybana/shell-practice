#!/bin/bash
userid=$(id -u )
if [ $userid -ne 0 ]
then
echo "error::dnf installed  with root user"
else "plz install dnf with root user"
exit1
fi
dnf install mysql -y

if [ $? -eq 0 ]
then
echo "run with dnf successfully"
else
echo "install dnf with root user and fail"
exit1
fi