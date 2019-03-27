#! /usr/bin/env sh

readonly BASEDIR=$(CDPATH="" cd -- "$(dirname -- "$0")" && pwd -P)

main()
{
	DATE=$(date +%F)

	if [ $# -gt 0 ]
	then
		for base in "$@"
		do
			DATE=$DATE BASE="$base" build_docker
		done

		# Intended lack of cleanup, as this step is generally a manual build. As
		# this is often used for debugging, cleanup is often not wanted. Manual
		# cleanup is still possible, though.

		return 0
	fi

	printf "%s\n" "Building all known images!"

	for base in "$BASEDIR/docker/"*
	do
		DATE=$DATE BASE="$(basename $base)" build_docker
	done

	cleanup
}

build_docker()
{
	[ -z "$DATE" ] && DATE=$(date +%F)
	[ -z "$BASE" ] && BASE=debian
	[ -z "$TAG" ] && TAG=$BASE

	make BASE="${BASE}" TAG="$TAG-$DATE" docker \
		&& docker push "tyil/perl6:$TAG-$DATE" \
		&& docker tag \
			"$(docker images | awk '/^tyil\/perl6\s+'"$TAG"'-'"$DATE"'\s+/ { print $3 }')" \
			tyil/perl6:debian-latest \
		&& docker push "tyil/perl6:$TAG-latest"
}

cleanup()
{
	docker rm $(docker ps -a -q)
	docker rmi $(docker images | grep '^<none>' | awk '{ print $3 }')
}

main "$@"
