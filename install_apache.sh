#!/bin/bash

yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo "Hello Everyone I am build with Terraform from $(hostname -f)" > /var/www/html/index.html