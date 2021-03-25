#!/bin/bash

. /etc/os-release

# cat /etc/os-release

echo "whoami"
whoami

# echo "which whoami"
# $(which sudo) whoami

echo "command whoami"
$(command -v sudo) whoami

echo "Try to install cmake"
case $ID in
    debian|ubuntu)
        echo "Hello Debian/Ubuntu"
        apt-get -qq update
        apt-get -qqy dist-upgrade
        apt-get -qqy install cmake
        ;;
    fedora)
        echo "Hello Fedora"
        dnf -y install cmake
        ;;
    centos)
        echo "Hello Centos"
        yum -y install cmake
        ;;
    *)
        echo "Unknown system"
        cat /etc/os-release
        exit 1
        ;;
esac
