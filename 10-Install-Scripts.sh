#!/bin/bash

USERID=$(id -u)

echo "$USERID"

if [ $USERID -ne 0 ]
then
  echo "Error :: You don't have access to execute"
  exit 1
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
  dnf install mysql -y
    if [ $? -ne 0 ]
    then
      echo "Installing MySQL is SUCCESS"
    else
      echo "Installing MYSQL is FAILURE"
      exit 1
    fi
else
  echo "MySQL is already Installed"
fi

dnf list installed git
if [ $? -ne 0 ]
then
  dnf install git -y
    if [ $? -ne 0 ]
    then
      echo "Installing GIT is SUCCESS"
    else
      echo "Installing GIT is FAILURE"
      exit 1
    fi
else
  echo "GIT is already Installed"
fi