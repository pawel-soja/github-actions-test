#!/bin/bash

set -e

pushd /tmp

git clone --depth=1 --branch=master https://github.com/indilib/indi.git
./indi/scripts/requisites-install.sh && \
./indi/scripts/googletest-build.sh && \
./indi/scripts/googletest-install.sh && \
./indi/scripts/indi-core-build.sh && \
./indi/scripts/indi-core-install.sh && \
./indi/scripts/indi-core-test.sh

apt-get install -y python3 python3-dev python3-setuptools
git clone --depth=1 https://github.com/geehalel/pyindi-client.git

pushd pyindi-client
python3 ./setup.py install
python3 -c "import PyIndi"
popd


popd
