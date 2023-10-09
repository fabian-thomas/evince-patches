#!/bin/sh
tag=$1
cd evince || exit 1
git am --abort; git reset "$tag"; git checkout shell libview/; git clean -i -- libview/ shell/
