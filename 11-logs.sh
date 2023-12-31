#!/bin/bash

ID=$(id -u)
TIMESTAMP=$(date +%F-%h-%M-%S)
R="\e[31m"
G="\e[32m"
N="\e[0m"

LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script started executing at $TIMESTAMP" &>>$LOGFILE

echo "script name: $0"

VALIDATE(){
    if [ $1 -ne 0 ]
    then 
    echo -e "ERROR:: $2 ...$R failed $N"
    exit 1
    else
    echo -e "$2 ...$G success $N"
    fi

}

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR:: please run this script with root user $N"
    exit 1 # you can give other than 0
else
    echo "you are root user"
fi #fi means reverse of if, indicating condition end

yum install mysql -y &>> $LOGFILE

VALIDATE $? "installing mysql"

yum install git -y &>> $LOGFILE

VALIDATE $? "installing git"