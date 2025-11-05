#!/bin/bash
USERID=$(id -u)
SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} #if days are provided that will be considered otherwise default 14 days considered

LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
check_root
mkdir -p $LOGS_FOLDER

USAGE(){
    echo -e "$R usage:: $N sh 20-backup.sh <source-dir> <dest-dir> <number of days>"
}



if [ $# -lt 2 ]
then 
USAGE
fi

if [ ! -d $SOURCE_DIR ]
then
echo -e "$R $SOURCE_DIR doesnot exist $N"
exit 1
fi 

if [ ! -d $DEST_DIR ]
then
echo -e "$R $DEST_DIR doesnot exist $N"
exit 1
fi 

FILES=$(find $SOURCE_DIR -name "*.log" -mtime +$DAYS)

if [ ! -z $FILES ]
then
echo "files found"
TIMESTAMP=$(date +%F-%H-%M-%s)
ZIP_FILE=$DEST_DIR/app-logs-$TIMESTAMP.zip"
find $SOURCE_DIR -name "*.log" -mtime +$DAYS | zip -@ "$ZIP_FILE"

if [ -f $ZIP_FILE ]
then
  echo -e "successfully  created zipfile"
  while ifs=read -r filepath
  do 
echo "deleting the file: $filepath" | tee -a $LOG_FILE
rm -rf $filepath
done  <<< $FILES

echo "logsfiles olderthan 14 days deleted"
  else 
  echo "zip file creation failure"
  exit 1
  fi
else
echo "no files hear"

fi


VALIDATE(){
if [ $1 -eq 0 ]
then 
echo -e " $G $2 is success $N" | tee -a $LOG_FILE
else
echo -e "$R $2 is failure $N" | tee -a $LOG_FILE
exit 1
fi
}

check_root(){
if [ $userid -ne 0 ]
then
echo -e "$R please run the script with root acess $N " |  tee -a  $LOG_FILE
exit 1
else
echo -e "$G script running with root access $N"
fi
}
