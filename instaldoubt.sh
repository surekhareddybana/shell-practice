#!/bin/bash
userid=$(id -u)
if [ userid = 0 ]
then 
dnf install mysql -y
else
echo " install dnf with root user"
fi