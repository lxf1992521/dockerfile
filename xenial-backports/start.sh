#!/bin/bash

cd -- "$(dirname -- "$0")" || exit 1

docker run -it --rm --network=host --name=ubuntu-build \
           -v /data/system/packages/builder/data/:/data/ \
           -v /data/system/packages/builder/debhelper/:/debhelper/ \
           -v /data/system/packages/builder/lists/:/var/lib/apt/lists/ \
           -v /data/system/packages/builder/archives/:/var/cache/apt/archives/ \
           -v $PWD/bashrc:/root/.bashrc:ro \
           ubuntu-build
