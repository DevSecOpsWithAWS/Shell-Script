#!/bin/bash


SOURCE_DIR=$1
DIST_DIR=$2
DAYS=${3:-14} # Days is a optional parameter if user not given any value then by default it will take 14 Days

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOG_FOLDER_NAME="/home/ec2-user/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d '.' -f1)
TIMESTAMP=$(date +%Y-%m-%d::%H:%M:%S)
LOG_FILE_NAME="$LOG_FOLDER_NAME/$LOG_FILE-$TIMESTAMP.log"

mkdir -p /home/ec2-user/shellscript-logs
USAGE(){
  echo -e "USAGE:: backup <SOURCE_DIR> <DIST_DIR> <DAYS(Optional)>"
  exit 1
}

if [ $# -lt 2 ]
then
  USAGE
fi

if [ -d $SOURCE_DIR ]
then
  echo -e "$SOURCE_DIR doesn't exit please check"
  exit 1
fi

if [ -d $DIST_DIR ]
then
  echo -e "$DIST_DIR doesn't exit please check"
  exit 1
fi