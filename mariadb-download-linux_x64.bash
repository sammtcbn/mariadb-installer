#!/bin/bash

MARIADB_VER=11.1.1
MARIADB_TARBALL=mariadb-${MARIADB_VER}-linux-systemd-x86_64.tar.gz
MARIADB_FOLDER_NAME=mariadb-${MARIADB_VER}-linux-systemd-x86_64

CURRDIR=$(cd $(dirname $0) && pwd)
ARCHIVES_TOP=${CURRDIR}/archives

function download()
{
  if [ ! -f ${MARIADB_TARBALL} ];then
    curl -f --output ${MARIADB_TARBALL} https://archive.mariadb.org/mariadb-${MARIADB_VER}/bintar-linux-systemd-x86_64/${MARIADB_TARBALL} || exit 1
  fi
}

function extract()
{
  rm -rf ${MARIADB_FOLDER_NAME} || exit 1
  tar zxfv ${MARIADB_TARBALL} || exit 1
}

function clean()
{
  return
}

function collect()
{
  mv ${MARIADB_FOLDER_NAME}/ archives || exit 1
}

rm -rf ${ARCHIVES_TOP} || exit 1

download
extract
clean
collect

echo "done"
