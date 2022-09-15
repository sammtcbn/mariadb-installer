#!/bin/bash
INS_PATH=/usr/local/sammtcbn/mariadb

if [ "$EUID" -ne 0 ]; then
    echo "Please run as root"
    exit
fi

mkdir -p ${INS_PATH} || exit 1
cp -a -f archives/* ${INS_PATH} || exit 1
