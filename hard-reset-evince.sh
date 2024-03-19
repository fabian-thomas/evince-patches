#!/bin/sh
if [ -z "$1" ]; then
    echo "first arg needs to be tag or branch"
    exit 1
fi
tag=$1
cd evince || exit 1
git am --abort; git reset "$tag"; git checkout shell libview/; git clean -i -- libview/ shell/
