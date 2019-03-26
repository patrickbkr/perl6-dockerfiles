#! /usr/bin/env sh

set -e

cd -- "$(mktemp -d)"
git clone https://github.com/ugexe/zef.git .
PERL6LIB="$(pwd)" perl6 bin/zef install .
