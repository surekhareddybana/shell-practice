#!/bin/bash
userid=$(id -u)
if [ userid -eq 0 ]
then
echo "run with dnf successfully"
else
echo " install dnf with root user"
fi