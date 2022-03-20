#!/bin/bash

source components/common.sh

Print "Installing nginx"
yum install nginx -y &>>$LOG_FILE
STAT_CHK $? "nginx installation"

Print "Download nginx repo"
curl -s -L -o /tmp/frontend.zip "https://github.com/roboshop-devops-project/frontend/archive/main.zip"
STAT_CHK $? "down load nginx repo"

Print "Deploy in Nginx Default Location"
rm -rf /usr/share/nginx/html/*
STAT_CHK $?

Print "Deploy"
cd /usr/share/nginx/html &>>$LOG_FILE  && unzip /tmp/frontend.zip &>>$LOG_FILE && mv frontend-main/* . &>>$LOG_FILE
STAT_CHK $?

Print "copy"

mv static/* . &>>LOG_FILE && rm -rf frontend-master static README.md &&>$LOG_FILE

Print "move localhost config"
mv localhost.conf /etc/nginx/default.d/roboshop.conf
STAT_CHK $?

Print "restart nginx"
systemctl restart nginx
STAT_CHK $?
