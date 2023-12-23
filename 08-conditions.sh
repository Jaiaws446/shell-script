#!/bin/bash

NUMBER=$1

if [ $NUMBER -gt 100 ]
then
    echo "given number $NUMBER is geater than 100"
else
    echo "given number $NUMBER is not geater than 100"
fi         