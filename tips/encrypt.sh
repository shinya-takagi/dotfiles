#!/bin/bash

password=$1

openssl genrsa -out ~/.ssh/password.key 2048
echo "$password" | openssl rsautl -encrypt -inkey ~/.ssh/password.key > ~/.ssh/.keygen_rsa
#ls --color
