#!/bin/bash

set -e

# alias nproc="sysctl -n hw.logicalcpu"
# whoami
# nproc

# apt-get update && apt-get -y upgrade && apt-get install -y \
#    git \
#    cmake build-essential zlib1g-dev \
#    libcfitsio-dev libnova-dev libusb-1.0-0-dev libcurl4-gnutls-dev \
#    libgsl-dev libjpeg-dev libfftw3-dev
#

brew install \
    git \
    cfitsio libnova libusb curl \
    gsl jpeg fftw

pushd /tmp
git clone --depth=1 --branch=fix-macos https://github.com/pawel-soja/indi.git
./indi/scripts/googletest-build.sh && \
./indi/scripts/googletest-install.sh && \
./indi/scripts/indi-core-build.sh && \
./indi/scripts/indi-core-install.sh && \
./indi/scripts/indi-core-test.sh
popd
