#!/bin/sh
cd evince || exit 1
git am --abort; git reset 44.1; git checkout shell libview/; git clean -i -- libview/ shell/
