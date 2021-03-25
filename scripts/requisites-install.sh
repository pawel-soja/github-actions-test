#!/bin/bash

set -e

. /etc/os-release

# libtiff-devel ?

case $ID in
    debian|ubuntu)
        export DEBIAN_FRONTEND=noninteractive
        $(command -v sudo) apt-get update
        $(command -v sudo) apt-get -y install \
            git \
            cmake build-essential zlib1g-dev \
            libcfitsio-dev libnova-dev libusb-1.0-0-dev libcurl4-gnutls-dev \
            libgsl-dev libjpeg-dev libfftw3-dev
        ;;
    fedora)
        $(command -v sudo) dnf -y install \
            git \
            cmake gcc-c++ zlib-devel \
            cfitsio-devel libnova-devel libusb-devel libcurl-devel \
            gsl-devel libjpeg-devel fftw-devel
        ;;
    centos)
        # CentOS 8 dont have libnova-devel package
        $(command -v sudo) yum -y install epel-release
        $(command -v sudo) yum -y upgrade
        $(command -v sudo) yum -y install \
            git \
            cmake gcc-c++ zlib-devel \
            cfitsio-devel libnova-devel libusb-devel libcurl-devel \
            gsl-devel libjpeg-devel fftw-devel
        ;;

    opensuse-tumbleweed)
        # broken git/openssh package
        # zypper refresh && zypper  --non-interactive update
        $(command -v sudo) zypper --non-interactive install -y \
            openssh git \
            cmake gcc-c++ zlib-devel \
            cfitsio-devel libnova-devel libusb-devel libcurl-devel \
            gsl-devel libjpeg-devel fftw-devel libtheora-devel
        ;;
    *)
        echo "Unknown Linux Distribution"
        cat /etc/os-release
        exit 1
        ;;
esac
