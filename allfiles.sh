#!/bin/bash

#This script brings all files 

for item in * 
do
    if [ -f $item ]
    then
        echo $item  
    fi 
done