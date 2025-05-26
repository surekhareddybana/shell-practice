#!/bin/bash
userid=$(id -u)
R="\e[31m
G="\e[32m
N="\e[0m
if [ $userid -eq 0]
then
echo -e "$G installed dnf $N"
else
echo -e "$R install dnf with root user $N"
fi