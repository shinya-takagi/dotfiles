#!/bin/bash

# Password encrypt on base64
#ENCPASS=$(echo "$PASS" | openssl enc -e -aes-256-cbc -iter 100 -base64 -k "$HOSTNAME")
#echo $ENCPASS > $HOME/.NAS_LAB.save

# Password decrypt from base64
ENCPASS=$(cat $HOME/.NAS.save)
echo "$ENCPASS" | openssl enc -d -aes-256-cbc -iter 100 -base64 -k "$HOSTNAME"


