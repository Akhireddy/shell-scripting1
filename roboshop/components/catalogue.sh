#!/bin/bash

source components/common.sh

Print "Install nodejs"
yum install nodejs make gcc-c++ -y
STAT_CHK $?

Print "user add"
id  APP_USER
if [ $APP_SER -ne 0]; then
  useradd $APP_USER
  else
    echo "user already existed"
fi

Print "dowload repo"
curl -s -L -o /tmp/catalogue.zip "https://github.com/roboshop-devops-project/catalogue/archive/main.zip"
STAT_CHK $?

Print "deploy"
su - roboshop && cd /home/roboshop &>>$LOG && unzip /tmp/catalogue.zip &>>$LOG && mv catalogue-main catalogue &>>$LOG && cd /home/roboshop/catalogue
STAT_CHK $?

Print "install npm"
npm install
STAT_CHK $?

Print "copy services"
mv /home/roboshop/catalogue/systemd.service /etc/systemd/system/catalogue.service
STAT_CHK $?

Print "start services"
systemctl daemon-reload &&  systemctl restart catalogue && systemctl enable catalogue
STAT_CHK $?