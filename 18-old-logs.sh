#!/bin/bash
R="\e[31m"
G="\e[32m"
y="\e[33m"
N="\e[0m"
userid=$(id -u)
LOGS_FOLDER="/var/log/shellscript_logs" #if you want create logs folder we need sudo access
SCRIPT_NAME=$( echo  $0 | cut -d "." -f1 )
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
SOURCE_DIR=/home/ec2-user/app-logs
mkdir -p $LOGS_FOLDER
if [ $userid -ne 0 ]
then
echo -e "$R please run the script with root acess $N " |  tee -a  $LOG_FILE
exit 1
else
echo -e "$G script running with root access $N"
fi
VALIDATE() {
if [ $1 -eq 0 ]
then 
echo -e " $G $2 is  successful $N" | tee -a $LOG_FILE
else
echo -e "$R $2 is  failure $N" | tee -a $LOG_FILE
exit 1
fi
}

echo "script started  executing at $(date)"
FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14) | tee -a $LOG_FILE

while IFS= read -r filepath
do
echo "deleting file from $filepath"
rm -rf $filepath
done <<< "$FILES_TO_DELETE"