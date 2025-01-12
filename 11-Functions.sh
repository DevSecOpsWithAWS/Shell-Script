#!/bin/bash

USERID=$(id -u)

echo "$USERID"
VALIDATE(){
  if [ $1 -ne 0 ]
    then
      echo "$2 SUCCESS"
    else
      echo "$2 FAILURE"
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
  echo "MySQL is already Installed"
fi

dnf list installed git
if [ $? -ne 0 ]
then
  dnf install git -y
    VALIDATE $? "Installing GIT is"
else
  echo "GIT is already Installed"
fi