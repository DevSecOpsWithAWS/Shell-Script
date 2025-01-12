#!/bin/bash

USERID=$(id -u)
echo "$USERID"

if [USERID - ne 0]
then
  echo "Error :: You don't have access to execute"
  exit 1
fi

dnf install mysql -y

dnf install git -y 