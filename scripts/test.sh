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

(cat <<EOF

struct Foo
{
    bool test() const { return this == nullptr; }
};

int main()
{
    Foo foo;
    return foo.test() ? 1 : 0;
}
EOF
) | g++ -x c++ - -o /tmp/a

exit

brew install \
    git \
    cfitsio libnova libusb curl \
    gsl jpeg fftw

pushd /tmp
git clone --depth=1 --branch=fix-macos https://github.com/indilib/indi.git
./indi/scripts/indi-core-build.sh
pwd
popd
