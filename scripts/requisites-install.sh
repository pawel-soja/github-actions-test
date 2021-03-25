#!/bin/bash

. /etc/os-release

# cat /etc/os-release

echo "whoami"
whoami

echo "which whoami"
$(which sudo) whoami

echo "command whoami"
$(command -v sudo) whoami

case $ID in
    debian|ubuntu)
        echo "Hello Debian or Ubuntu";;
    fedora)
        echo "Hello Fedora";;
    centos)
        echo "Hello Centos";;
    *)
        exit 1;;
esac
