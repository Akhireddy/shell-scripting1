#!/bin/bash

source components/common.sh

Print "install nginx "
sudo yum install nginx -y
STAT_CHK $?

Print "Enable & start nginx services"
systemctl enable nginx && systemctl start nginx
STAT_CHK $?
