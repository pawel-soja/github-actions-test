#!/bin/bash

set -e

. /etc/os-release

case $ID in
    debian|ubuntu)
        ls -l /var/cache/apt
        export DEBIAN_FRONTEND=noninteractive
        $(command -v sudo) apt-get update
        $(command -v sudo) apt-get -y install \
            libnova-dev libcfitsio-dev libusb-1.0-0-dev zlib1g-dev \
            libgsl-dev build-essential cmake git libjpeg-dev \
            libcurl4-gnutls-dev libtiff-dev libfftw3-dev
        ;;
    fedora)
        ls -l /var/cache/dnf
        $(command -v sudo) dnf -y install \
            libnova-devel cfitsio-devel libusb-devel zlib-devel \
            gsl-devel cmake git libjpeg-devel \
            libcurl-devel libtiff-devel fftw-devel \
            gcc-c++
        ;;
    centos)
        ls -l /var/cache/yum
        $(command -v sudo) yum -y install epel-release
        $(command -v sudo) yum -y upgrade
        $(command -v sudo) yum -y install \
            libnova-devel cfitsio-devel libusbx-devel libusb-devel zlib-devel \
            gsl-devel cmake git libjpeg-devel \
            libcurl-devel libtiff-devel fftw-devel
        ;;

        # CentOS 8 dont have libnova-devel package
    *)
        echo "Unknown Linux Distribution"
        cat /etc/os-release
        exit 1
        ;;
esac
