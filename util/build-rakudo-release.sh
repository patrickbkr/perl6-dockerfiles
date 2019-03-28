#!/usr/bin/env sh

set -e

printf "Building Rakudo Perl 6 %s in %s\n" "$RAKUDO_VERSION" "$dir" >&2

dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)

cd $dir
wget -O rakudo-${RAKUDO_VERSION}.tar.gz https://rakudo.org/dl/rakudo/rakudo-${RAKUDO_VERSION}.tar.gz
tar xzf rakudo-${RAKUDO_VERSION}.tar.gz
cd rakudo-${RAKUDO_VERSION}
perl Configure.pl --backend=moar --gen-moar --prefix=/usr/local
make --jobs=`nproc` install

printf "Installing zef\n" >&2

cd $dir
git clone https://github.com/ugexe/zef.git zef
cd zef
perl6 -I. bin/zef install .

