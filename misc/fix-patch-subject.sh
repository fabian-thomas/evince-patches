#!/usr/bin/env sh
for f in "$@";
do
    sed -i "s/Subject: .*$/Subject: $(basename "$f")/" "$f"
done
