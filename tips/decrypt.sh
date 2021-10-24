#!/bin/bash

PASSWROD=$(openssl rsautl -decrypt -inkey ~/.ssh/password.key -in password.txt)
    echo $PASSWROD
if [ "password" = "$PASSWROD" ]; then
    echo test
fi
