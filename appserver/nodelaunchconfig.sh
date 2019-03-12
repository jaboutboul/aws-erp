#!/bin/bash
curl -sL https://rpm.nodesource.com/setup_10.x | sudo bash -
yum -y install nodejs
su ec2-user -c "mkdir -p ~/nodejs/server && cd ~/nodejs/server" && "chown -R ec2-user:ec2-user ~/home/nodejs/"
aws s3 cp s3://appserverconfig/config/index.js /home/ec2-user/nodejs/server/index.js
npm i -g pm2
npm -y init
npm i express --save-dev
npm i external-ip
pm2 start /home/ec2-user/nodejs/server/index.js -i 0 --name "node-app"
crontab -l | { cat; echo "@reboot pm2 start /home/ec2-user/nodejs/server/index.js -i 0 --name \"node-app\""; } | crontab -