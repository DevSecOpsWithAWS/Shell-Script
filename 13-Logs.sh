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
echo "$USERID"
VALIDATE(){
  if [ $1 -ne 0 ]
    then
      echo -e "$2 $G SUCCESS $N"
    else
      echo -e "$2 $R FAILURE $N"
      exit 1
    fi
}

if [ $USERID -ne 0 ]
then
  echo "Error :: You don't have access to execute"
  exit 1
fi

dnf list installed mysql &>> $LOG_FILE_NAME
if [ $? -ne 0 ]
then
  dnf install mysql -y &>> $LOG_FILE_NAME
  VALIDATE $? "Installing MYSQL is"
else
  echo -e "$Y MySQL is already Installed"
fi

dnf list installed git &>> $LOG_FILE_NAME
if [ $? -ne 0 ]
then
  dnf install git -y &>> $LOG_FILE_NAME
    VALIDATE $? "Installing GIT is"
else
  echo -e "$Y GIT is already Installed"
fi