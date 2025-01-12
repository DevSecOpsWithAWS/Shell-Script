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
echo "Script stating executed at --> $TIMESTAMP"
if [ $USERID -ne 0 ]
then
  echo "Error :: You don't have access to execute"
  exit 1
fi

for package in $@
do
  dnf list installed $package &>> $LOG_FILE_NAME
  if [ $? -ne 0 ]
  then
    dnf install $package -y &>> $LOG_FILE_NAME
    VALIDATE $? "Installing $package"
  else
    echo -e "$package is already $Y ... Installed $N"
  fi
done