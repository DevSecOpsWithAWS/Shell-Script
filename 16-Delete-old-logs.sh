#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOG_FOLDER_NAME="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d '.' -f1)
TIMESTAMP=$(date +%Y-%m-%d::%H:%M:%S)
LOG_FILE_NAME="$LOG_FOLDER_NAME/$LOG_FILE-$TIMESTAMP.log"
SOURCE_DIR="/home/ec2-user/app-logs"

VALIDATE(){
  if [ $1 -ne 0 ]
    then
      echo -e "$2 $G FAILURE $N"
      exit 1
    else
      echo -e "$2 $R SUCCESS $N"
    fi
}
echo "$USERID"

if [ $USERID -ne 0 ]
then
  echo "Error --> You don't have access to execute"
  exit 1
fi

echo "Script stating executed at --> $TIMESTAMP"

FILES_TO_DELETE=$(find $SOURCE_DIR -name "*.log" -mtime +14)

echo "files to delete $FILES_TO_DELETE"

while read -r filepath
do
  echo "Deleting file: $filepath" &>>$LOG_FILE_NAME
  rm -rf $filepath
  echo "Deleted file: $filepath"
done >>> $FILES_TO_DELETE
