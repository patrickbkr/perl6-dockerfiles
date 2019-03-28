#! /usr/bin/env sh

printf "Building NQP from %s (%s)\n" "$NQP_REPO" "$NQP_BRANCH" >&2

cd -- "$(mktemp -d)"
git clone --branch "$NQP_BRANCH" "$NQP_REPO" .
./Configure.pl --backend=moar --prefix=/usr/local
make
make install
