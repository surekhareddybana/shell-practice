#!/bin/bash

USERID=$(id -u) 
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then 
echo -e "$R error:: $N please run the script with root access"
exit 1
else
echo "your running with root access"
fi

VALIDATE(){
    if [ $1 -eq 0 ]
then
echo -e "installing $2 is  $G successfull $N"
else
echo -e "installing $2 is $R failure $N"
exit 1
fi
}

dnf list installed mysql
# check mysql is installed or not..if mysql is installed $?=0
#if mysql is not installed $? not equal 0
if [ $? -ne 0 ]
then
echo -e "$R mysql is not installed..please go and install $N"
dnf install mysql -y
VALIDATE $? "my sql" # hear $1 input is exit status

else
echo -e "$G mysql installed..nothing to do"
fi


dnf list installed python3
# check mysql is installed or not..if mysql is installed $?=0
#if mysql is not installed $? not equal 0
if [ $? -ne 0 ]
then
echo "python3 not installed..please go and install"
dnf install python3 -y
VALIDATE $? "python3"
else
echo "pyhton3 installed..nothing to do"
fi


dnf list installed nginx
# check mysql is installed or not..if mysql is installed $?=0
#if mysql is not installed $? not equal 0
if [ $? -ne 0 ]
then
echo "nginx not installed..please go and install"
dnf install nginx -y
VALIDATE $? "nginx"
else
echo "nginx installed..nothing to do"
fi