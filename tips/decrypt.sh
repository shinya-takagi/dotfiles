#!/bin/bash

mainfile=main
PASSWROD=$(openssl rsautl -decrypt -inkey ~/.ssh/password.key -in $mainfile)
    echo $PASSWROD
if [ "password" = "$PASSWROD" ]; then
    echo test
fi
