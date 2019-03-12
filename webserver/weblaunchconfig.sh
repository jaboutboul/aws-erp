#!/bin/bash
yum -y install nginx
cd /etc/nginx/ && aws s3 cp s3://nginxrouterconfig/config/nginx.conf .
cd /etc/nginx/conf.d && aws s3 cp s3://nginxrouterconfig/config/ERProuter.conf .
service nginx start
chkconfig nginx on