#! /usr/bin/env sh

set -e

dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd -P)

if [ "${RELEASE}" = '1' ]; then
    sh $dir/build-rakudo-release.sh
else
    sh $dir/build-moarvm.sh
    sh $dir/build-nqp.sh
    sh $dir/build-rakudo.sh
    sh $dir/bootstrap-zef.sh
fi
