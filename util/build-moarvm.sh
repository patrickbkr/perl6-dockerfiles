#! /usr/bin/env sh

set -e

printf "Building MoarVM from %s (%s)\n" "$MOAR_REPO" "$MOAR_BRANCH" >&2

cd -- "$(mktemp -d)"
git clone --branch "$MOAR_BRANCH" "$MOAR_REPO" .
./Configure.pl --prefix=/usr/local
make
make install
