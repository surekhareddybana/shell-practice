#!/bin/bash
DISK_USAGE=$(df -hT | grep -v Filesystem)
DISK_THRESHOLD=1 #in project it will be 75
MSG=""

while IFS= read -r line
do
USAGE=$(echo $line | awk '{print $6}' |  cut -d "%" -f1)
PARTITION=$(echo $line | awk '{print $7F}')
if [ $USAGE -ge $DISK_THRESHOLD]
then
MSG="high disk usage on $PARTITION: $USAGE"
echo "$PARTITION: $USAGE" 

done <<< "$DISK_USAGE"
echo $MSG