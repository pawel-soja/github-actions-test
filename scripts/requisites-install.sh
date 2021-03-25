#!/bin/bash

set -e

. /etc/os-release

case $ID in
    debian|ubuntu)
        $(command -v sudo) apt-get -qq update
        $(command -v sudo) apt-get -qqy dist-upgrade
        $(command -v sudo) apt-get -qqy install \
            libnova-dev libcfitsio-dev libusb-1.0-0-dev zlib1g-dev \
            libgsl-dev build-essential cmake git libjpeg-dev \
            libcurl4-gnutls-dev libtiff-dev libfftw3-dev
        ;;
    fedora)
        $(command -v sudo) dnf -y install \
            libnova-devel cfitsio-devel libusb-devel zlib-devel \
            gsl-devel build-essential cmake git libjpeg-devel \
            libcurl-devel libtiff-devel fftw-devel
        ;;
    centos)
        echo "Hello Centos"
        yum -y install install \
            libnova-devel libcfitsio-devel libusb-1.0-0-devel zlib1g-devel \
            libgsl-devel build-essential cmake git libjpeg-devel \
            libcurl4-gnutls-devel libtiff-devel libfftw3-devel
        ;;
    *)
        echo "Unknown Linux Distribution"
        cat /etc/os-release
        exit 1
        ;;
esac
