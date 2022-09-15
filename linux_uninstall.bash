#!/bin/bash
INS_PATH=/usr/local/sammtcbn/mariadb

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit
fi

rm -rf --preserve-root ${INS_PATH}
