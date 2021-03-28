#!/bin/bash


# alias nproc="sysctl -n hw.logicalcpu"
# whoami
# nproc

brew install git

pushd /tmp
git clone --depth=1 https://github.com/indilib/indi.git
./indi/scripts/indi-core-build.sh
pwd
popd
