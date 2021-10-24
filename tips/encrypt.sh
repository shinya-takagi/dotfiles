#!/bin/bash

password=$1
password='Shinya01'
file=$2

#if [ -e "password.key" ]; then
#    rm ~/.ssh/password.key
#fi
openssl genrsa -out ~/.ssh/$file.key 2048
echo "$password" | openssl rsautl -encrypt -inkey ~/.ssh/$file.key > ~/.ssh/$file
#ls --color
