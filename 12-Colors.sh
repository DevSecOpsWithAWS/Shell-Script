#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
echo "$USERID"
VALIDATE(){
  if [ $1 -ne 0 ]
    then
      echo -e "$2 $G SUCCESS"
    else
      echo -e "$2 $R FAILURE"
      exit 1
    fi
}

if [ $USERID -ne 0 ]
then
  echo "Error :: You don't have access to execute"
  exit 1
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
  dnf install mysql -y
  VALIDATE $? "Installing MYSQL is"
else
  echo -e "$Y MySQL is already Installed"
fi

dnf list installed git
if [ $? -ne 0 ]
then
  dnf install git -y
    VALIDATE $? "Installing GIT is"
else
  echo -e "$Y GIT is already Installed"
fi