#!/bin/bash

ID=$(id -u)

if [ $ID -ne 0 ]
then
    echo "ERROR:: please run this script with root user"
    exit 1 # you can give other than 0
else
    echo "you are root user"
fi #fi means reverse of if, indicating condition end

yum install mysql -y

if [ $? -ne 0 ]
then 
    echo "ERROR:: installing MYSQL is failed"
    exit 1
else
    echo "SUCCESS:: installing MYSQL"
fi 

yum install git -y

if [ $? -ne 0 ]
then 
    echo "ERROR:: installing git is failed"
    exit 1
else
    echo "SUCCESS:: installing git"

fi 




