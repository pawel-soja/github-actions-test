#!/bin/bash

command -v nproc >/dev/null 2>&1 || function nproc {
    echo "Implement nproc"
    command -v sysctl >/dev/null 2>&1 &&  \
        sysctl -n hw.logicalcpu ||
        echo "3"
}

echo $(nproc)
