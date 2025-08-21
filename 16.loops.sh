#!/bin/bash

USERID=$(id -u) 
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shell-script-logs" # hear LOGS_FOLDER is a variable
SCRIPT_NAME="$(echo $0 | cut -d "." -f1)" # hear $0 means current script name
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("mysql" "python" "nginx")
mkdir -p $LOGS_FOLDER
echo "script started executing at : $(date)"  | tee -a $LOG_FILE



if [ $USERID -ne 0 ]
then 
echo -e "$R error:: $N please run the script with root access" | tee -a $LOG_FILE
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

#for package in ${PACKAGES[@]}
for package in $@
do
dnf list installed $package &>>$LOG_FILE
if [ $? -ne 0 ]
then
echo -e "$R $package is not installed..please go and install $N" &>>$LOG_FILE
dnf install $package -y
VALIDATE $? "$package" # hear $1 input is exit status

else
echo -e "$G mysql installed..nothing to do" &>>$LOG_FILE
fi
done
