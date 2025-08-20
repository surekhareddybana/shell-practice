#!/bin/bash

USERID=$(id -u) 
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script-logs" # hear LOGS_FOLDER is a variable
SCRIPT_NAME="$(echo $0 | cut -d "." -f1)" # hear $0 means current script name
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "script started executing at : $(date)" &>>$LOG_FILE



if [ $USERID -ne 0 ]
then 
echo -e "$R error:: $N please run the script with root access" &>>$LOG_FILE
exit 1
else
echo "your running with root access" &>>$LOG_FILE
fi

VALIDATE(){
    if [ $1 -eq 0 ]
then
echo -e "installing $2 is  $G successfull $N" &>>$LOG_FILE
else
echo -e "installing $2 is $R failure $N" &>>$LOG_FILE
exit 1
fi
}

dnf list installed mysql
# check mysql is installed or not..if mysql is installed $?=0
#if mysql is not installed $? not equal 0
if [ $? -ne 0 ]
then
echo -e "$R mysql is not installed..please go and install $N" &>>$LOG_FILE
dnf install mysql -y
VALIDATE $? "my sql" # hear $1 input is exit status

else
echo -e "$G mysql installed..nothing to do" &>>$LOG_FILE
fi


dnf list installed python3
# check mysql is installed or not..if mysql is installed $?=0
#if mysql is not installed $? not equal 0
if [ $? -ne 0 ]
then
echo "python3 not installed..please go and install" &>>$LOG_FILE
dnf install python3 -y
VALIDATE $? "python3"
else
echo "pyhton3 installed..nothing to do" &>>$LOG_FILE
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