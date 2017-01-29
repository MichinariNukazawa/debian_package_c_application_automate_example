#!/bin/bash
#
# .deb package "Chapter 4. Simple Example" automation
# https://www.debian.org/doc/manuals/debmake-doc/ch04.en.html
#
# Author: michinari.nukazawa@gmail.com
#

set -eu
set -o pipefail

export LC_ALL='C'

trap 'echo "error:$0($LINENO) \"$BASH_COMMAND\" \"$@\""' ERR

SCRIPT_DIR=$(cd $(dirname $0); pwd)
ROOT_DIR=${SCRIPT_DIR}/..

APP_NAME=debhello
VERSION=0.0
DEB_OBJECT_DIR=${ROOT_DIR}/object/deb_object
DEB_OVERWRITE=${SCRIPT_DIR}/deb_overwrite
PACKAGE_DIR_NAME=${APP_NAME}-${VERSION}


# set environment value for DEB tools
export DEBEMAIL="michinari.nukazawa@gmail.com"
export DEBFULLNAME="Michinari.Nukazawa"


# make .tar.gz source package
rm -rf ${DEB_OBJECT_DIR}
mkdir -p ${DEB_OBJECT_DIR}
pushd ${DEB_OBJECT_DIR}
mkdir -p ${PACKAGE_DIR_NAME}

cp -r ${ROOT_DIR}/src ${PACKAGE_DIR_NAME}/
cp ${ROOT_DIR}/Makefile ${PACKAGE_DIR_NAME}/
touch ${PACKAGE_DIR_NAME}/LICENSE

tar -zcvf ${PACKAGE_DIR_NAME}.tar.gz ${PACKAGE_DIR_NAME}/


# generate default debian setting file and overwrite
pushd ${PACKAGE_DIR_NAME}/

debmake

cp ${DEB_OVERWRITE}/debian/rules     debian/rules
cp ${DEB_OVERWRITE}/debian/control   debian/control
cp ${DEB_OVERWRITE}/debian/copyright debian/copyright


# build .deb file
debuild -us -uc

[ -f ../${APP_NAME}_${VERSION}-1_amd64.deb ]


