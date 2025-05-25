#!/bin/bash
USERID=$(id -u) 

if [ $USERID -ne 0 ]
then 
echo "error: please run with root user id"
fi
dnf install mysql -y
if [ $? -eq 0 ]
then
echo "installing of mysql is successful"
else 
echo "installing of mysql is unsuccessful"
exit 1
fi