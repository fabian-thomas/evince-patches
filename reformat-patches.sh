#!/usr/bin/env bash
set -e

./hard-reset-evince.sh "$1"

shopt -s extglob
# -C 0 makes sure that some patches get applied even though the context
# does not perfectly match
cd evince || exit 1
for patch in ../patches/*; do
    git am -3 -C 0 "$patch"
    git format-patch HEAD^ --stdout > "$patch"
    git reset --hard HEAD^
done
cd .. || exit 1
./misc/fix-patch-subject.sh
