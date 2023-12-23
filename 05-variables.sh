#!/bin/bash

echo "please enter your username"

read -s USERNAME #the value entered above will be automatically attached USERNAME variable

#echo "username is: $USERNAME" # iam printing just for validation, you shoud not print username and passwords

echo "please enter your password"

read -s PASSWORD

echo "username is: $USERNAME, password is: $PASSWORD"