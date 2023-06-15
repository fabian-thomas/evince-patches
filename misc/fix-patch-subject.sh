#!/usr/bin/env sh
for f in patches/*;
do
    sed -i "s/Subject: .*$/Subject: $(basename "$f")/" "$f"
done
