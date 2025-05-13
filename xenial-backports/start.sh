#!/bin/bash

cd -- "$(dirname -- "$0")" || exit 1

docker run -it --rm --network=host -w /root \
           -v xenial-backports-apt-cache:/var/cache/apt/archives/ \
           -v xenial-backports-apt-lists:/var/lib/apt/lists/ \
           -v $PWD/builder/data/:/data/ \
           -v $PWD/builder/debhelper/:/debhelper/ \
           -v $PWD/bashrc:/root/.bashrc:ro \
           ubuntu-build
