#! /usr/bin/env sh

printf "Building Rakudo from %s (%s)\n" "$RAKUDO_REPO" "$RAKUDO_BRANCH" >&2

cd -- "$(mktemp -d)"
git clone --branch "$RAKUDO_BRANCH" "$RAKUDO_REPO" .
./Configure.pl --backend=moar --prefix=/usr/local
make
make install
