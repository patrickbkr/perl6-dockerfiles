# Tyil's Perl 6 build utilities

This repository contains some utilities I use to build [Perl
6](https://perl6.org/). There's a `Makefile` available to make it
straightforward and easy to use. The main purpose of the tools in this
repository is to build
[Docker](https://en.wikipedia.org/wiki/Docker_%28software%29) images suitable
for running Perl 6 applications with. It can also be used to build a Perl 6
installation with a custom [MoarVM](https://moarvm.org/),
[NQP](https://github.com/perl6/nqp) or [Rakudo](https://rakudo.org/) part (or
any or all of them) to test out certain patches or upcoming releases.

This image also contains [Zef](https://github.com/ugexe/zef), the Perl 6 module
manager, as this is incredibly useful for most usecases of this image.

## Building the image

To build the Docker image, simply run `make` in the repository root. By
default, this will create an image based on `debian:stable-slim`, which is a
minimal Debian image.

### Using different sources, branches or base images

This repository is built up to allow for experimentation with the Perl 6 base.
The branch and repository URLs can all be changed individually to build a Perl
6 using a specific branch for testing purposes. You can pass the following
arguments to `make` to alter the build instructions:

- `MOAR_BRANCH` - The branch to use of the `$MOAR_REPO`.
- `MOAR_REPO` - The URL to pull the MoarVM repository from.
- `NQP_BRANCH` - The branch to use of the `$NQP_REPO`.
- `NQP_REPO` - The URL to pull the NQP repository from.
- `RAKUDO_BRANCH` - The branch to use of the `$RAKUDO_REPO`.
- `RAKUDO_REPO` - The URL to pull the Rakudo repository from.

By default, the official upstream sources are used for the `$*_REPO` values,
and `master` is used as the branch. There are also options to change the base
image used by Docker, and to change the resulting image's name and tag:

- `BASE` - The base Docker image to build the Perl 6 Docker image on. Currently
  only `alpine` and `debian` are supported options. Defaults to `debian`.
- `USER` - The username to use for the resulting Docker image. Defaults to the
  running user's `$USER`.
- `NAME` - The name of the resulting Docker image. Defaults to `perl6`.
- `TAG` - The tag of the resulting Docker. Defaults to `latest`.

## License

All code in this repository is made available under the terms of the GNU Affero
General Public License, version 3 or later.
