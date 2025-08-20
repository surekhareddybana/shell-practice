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
# check mysql is installed or not..if mysql is installed $?-0
#if mysql is not installed $? not equal 0
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
dnf list installed python3
if [ $? -ne 0 ]
then
echo "python3 is not installed..go and install"
dnf install python3 -y
if [ $? -eq 0 ]
then
echo "python3 installed successfull"
else
echo "python3 is install failure"
exit 1
fi
else
echo "python3 is installed..nothing to do"
fi

dnf list installed nginx
if [ $? -ne 0 ]
then
echo "nginx is not installed.. go and installed"
dnf install nginx -y
if [ $? -eq 0 ]
then 
echo "nginx is installed successfull"
else
echo "nginx installed failure"
exit 1
fi
else 
echo "nginx is installed..nothing to do"
fi




