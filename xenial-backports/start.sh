#!/bin/bash

cd -- "$(dirname -- "$0")" || exit 1

docker run -it --rm --network=host -w /root --name=ubuntu-build \
           -v /data/ubuntu/packages/builder/data/:/data/ \
           -v /data/ubuntu/packages/builder/debhelper/:/debhelper/ \
           -v xenial-backports-apt-lists:/var/lib/apt/lists/ \
           -v xenial-backports-apt-cache:/var/cache/apt/archives/ \
           -v $PWD/bashrc:/root/.bashrc:ro \
           ubuntu-build
