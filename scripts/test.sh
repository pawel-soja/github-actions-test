#!/bin/bash

set -e

# alias nproc="sysctl -n hw.logicalcpu"
# whoami
# nproc

brew install git cfitsio

pushd /tmp
git clone --depth=1 --branch=fix-macos https://github.com/indilib/indi.git
./indi/scripts/indi-core-build.sh
pwd
popd
