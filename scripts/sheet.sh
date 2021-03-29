#!/bin/bash

(cat <<EOF

struct Foo
{
    bool test() const { return reinterpret_cast<const void*>(this) == nullptr; }
};

int main()
{
    Foo foo;
    return foo.test() ? 1 : 0;
}
EOF
) | clang -x c++ -std=c++11 - -o /tmp/a
