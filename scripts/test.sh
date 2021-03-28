#!/bin/bash


# alias nproc="sysctl -n hw.logicalcpu"
# whoami
# nproc
command -v realpath >/dev/null 2>&1 || realpath() {
    [[ $1 = /* ]] && echo "$1" || echo "$PWD/${1#./}"
}

echo $(realpath $0)
SRCS=$(dirname $(realpath $0))/..
echo $SRCS

exit 0

brew install git

pushd /tmp
git clone --depth=1 https://github.com/indilib/indi.git
./indi/scripts/indi-core-build.sh
pwd
popd
