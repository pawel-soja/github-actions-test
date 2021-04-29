#!/bin/bash

(cat <<EOF
#include <stdio.h>
extern char *__progname;
int main()
{
    printf("progname: %s\n", __progname);
}
EOF
) | clang -x c++ -std=c++11 - -o /tmp/application
/tmp/application
