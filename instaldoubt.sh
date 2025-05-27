#!/bin/bash
userid=$(id -u)
if [ $userid -ne 0 ]
then
echo "Error:: dnf install  with root user"
exit 1
#else
#echo "please install dnf with root user"
fi
dnf list installed mysql
if [ $? -ne 0 ]
then
echo "dnf not installed..please go and install"
dnf install mysql -y
if [ $? -eq 0 ]
then
echo "dnf install successfull"
else
echo "dnf install failure"
exit 1
fi
else
echo "dnf installed..nothing to do"
fi
