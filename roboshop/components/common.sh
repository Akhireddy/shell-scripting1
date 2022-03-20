#!/bin/bash

LOG_FILE=/tmp/logfile
rm -rf $LOG_FILE

USER=$(id -u)
if [ $USER -ne 0 ]; then
   echo -e "\e[1;31m you should be in root\e[0m"
  exit 1
fi

Print() {
   echo -e "\n -------------------- $1 ------------ "
   echo -e "\e[1;36m $1 \e[0m"
}

STAT_CHK() {
if [ $? -eq 0 ]; then
   echo -e "\e[1;32m  Succes\e[0m"
else
   echo -e "\e[1;32m Failed\e[0m"
   exit 1
fi
}


