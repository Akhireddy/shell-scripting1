#!/bin/bash

USER=$(id -u)
if [ $USER -ne 0 ]; then
   echo -e "\e[31m you should be root user\e[0m"
   exit 1
   fi

STAT_CHK() {
  if [ $? -ne 0 ]; then
    echo -e "\e[31m Failed \e[0m"
  else
    echo -e "\e[32m Success \e[0m"
    exit 1
  fi
}

Print() {
  echo -e "\n ============= $1 ===============" &>>$LOG_FILE
  echo -e "\e[36m $1 \e[0m"
}

LOG_FILE=/tmp/logfile
rm -rf $LOG_FILE

