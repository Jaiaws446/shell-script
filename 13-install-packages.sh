#!/bin/bash

ID=$(id -u)
R="\e[31m"
G="\e[32m"
N="\e[0m"

TIMESTAMP=$(date +%F-%H-%M-%S)
LOGFILE="/tmp/$0-$TIMESTAMP.log"

echo "script started executing at $TIMESTAMP" &>> $LOGFILE

VALIDATE(){
    if [ $1 -ne 0 ]  
    then
        echo -e "$2 ... $R FAILED $N"
    else
        echo -e "$2 ... $G SUCCESS $N"
    fi         
}

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR:: please run this script with root user $N"
    exit 1 # you can give other than 0
else
    echo "you are root user"
fi #fi means reverse of if, indicating condition end

#echo "all args passed: $@"
#git mysql postfix net-tools
#package = git for first time

for package in $@ 
do
yum list installed $package &>> $LOGFILE #check installaed or not

if {$? -ne 0} #if not installed
then 
    yum install $package -y &>> LOGFILE #install the package
    VALIDATE $? "installation of $package" #validate
else
    echo -e "$package is already installed ...$Y skipping $N"
fi     

done